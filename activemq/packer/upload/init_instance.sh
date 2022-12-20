#!/bin/bash

INSTANCE_ID="`wget -qO- http://169.254.169.254/latest/meta-data/instance-id`"
REGION="`wget -qO- http://169.254.169.254/latest/meta-data/placement/availability-zone | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"
echo "Instance: $INSTANCE_ID"
echo "Region: $REGION"

HOSTNAME="`aws ec2 describe-tags --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=Name" --region $REGION --output=text | cut -f5`"
echo "Hostname: $HOSTNAME"
hostnamectl set-hostname $HOSTNAME

IP=$(curl -sS http://169.254.169.254/latest/meta-data/local-ipv4)
RECORD=$1
ZONE=$2

if [ "$RECORD" == "" ]; then
  RECORD="`aws ec2 describe-tags --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=route53_record" --region $REGION --output=text | cut -f5`"
fi
if [ "$ZONE" == "" ]; then
  ZONE="`aws ec2 describe-tags --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=route53_zone" --region $REGION --output=text | cut -f5`"
fi

echo "Current IP: $IP"
echo "Record: $RECORD"
echo "Zone: $ZONE"

cat > /opt/route53.json <<- EndOfMessage
{
  "Comment": "update activemq ip",
  "Changes": [
    {
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "$RECORD",
        "Type": "A",
        "TTL": 60,
        "ResourceRecords": [
          {
            "Value": "$IP"
          }
        ]
      }
    }
  ]
}
EndOfMessage

cat /opt/route53.json

set +x

aws route53 change-resource-record-sets --hosted-zone-id $ZONE --change-batch file:///opt/route53.json
