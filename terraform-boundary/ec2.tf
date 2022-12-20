locals {
  priv_ssh_key_real = coalesce(var.priv_ssh_key_path,trimsuffix(var.pub_ssh_key_path,".pub"))
}

resource "aws_key_pair" "boundary" {
  key_name   = "boundary_key"
  public_key = file(var.pub_ssh_key_path)

  #  tags = local.tags
}

resource "aws_instance" "boundary" {
  count                       = var.num_controllers
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  iam_instance_profile        = aws_iam_instance_profile.boundary.name
  #availability_zone           = var.azs[0]
  subnet_id                   = var.subnet_ids[0]
  vpc_security_group_ids      = [aws_security_group.boundary.id]
  associate_public_ip_address = true

  connection {
    type         = "ssh"
    user         = "ec2-user"
    private_key  = file(local.priv_ssh_key_real)
    host         = self.public_ip
  }

 provisioner "remote-exec" {
    inline = [
      "sudo mkdir -p /etc/pki/tls/boundary",
      "echo '${tls_private_key.boundary.private_key_pem}' | sudo tee ${var.tls_key_path}",
      "echo '${tls_self_signed_cert.boundary.cert_pem}' | sudo tee ${var.tls_cert_path}",
    ]
  }

  provisioner "file" {
    source      = "${path.module}/files/boundary"
    destination = "/home/ec2-user/boundary"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /home/ec2-user/boundary /usr/local/bin/boundary",
      "sudo chmod 0755 /usr/local/bin/boundary",
    ]
  }

  provisioner "file" {
    content = templatefile("${path.module}/install/controller.hcl.tpl", {
      name_suffix            = count.index
      db_endpoint            = aws_db_instance.boundary-db.endpoint
      private_ip             = self.private_ip
      tls_disabled           = var.tls_disabled
      tls_key_path           = var.tls_key_path
      tls_cert_path          = var.tls_cert_path
      kms_type               = var.kms_type
      kms_worker_auth_key_id = aws_kms_key.worker_auth.id
      kms_recovery_key_id    = aws_kms_key.recovery.id
      kms_root_key_id        = aws_kms_key.root.id
    })
    destination = "/home/ec2-user/boundary-controller.hcl"
  }

  provisioner "remote-exec" {
    inline = ["sudo mv /home/ec2-user/boundary-controller.hcl /etc/boundary-controller.hcl"]
  }

  provisioner "file" {
    source      = "${path.module}/install/install.sh"
    destination = "/home/ec2-user/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 0755 /home/ec2-user/install.sh",
      "sudo /home/ec2-user/./install.sh controller"
    ]
  }

  provisioner "file" {
    content = templatefile("${path.module}/install/worker.hcl.tpl", {
      controller_ips         = self.private_ip
      name_suffix            = count.index
      public_ip              = self.public_ip
      private_ip             = self.private_ip
      tls_disabled           = var.tls_disabled
      tls_key_path           = var.tls_key_path
      tls_cert_path          = var.tls_cert_path
      kms_type               = var.kms_type
      kms_worker_auth_key_id = aws_kms_key.worker_auth.id
    })
    destination = "/home/ec2-user/boundary-worker.hcl"
  }

  provisioner "remote-exec" {
    inline = ["sudo mv /home/ec2-user/boundary-worker.hcl /etc/boundary-worker.hcl"]
  }

  provisioner "file" {
    source      = "${path.module}/install/install.sh"
    destination = "/home/ec2-user/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 0755 /home/ec2-user/install.sh",
      "sudo /home/ec2-user/./install.sh worker"
    ]
  }
 
  provisioner "file" {
    source      = "${path.module}/install/setup.sh"
    destination = "/home/ec2-user/setup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 0755 /home/ec2-user/setup.sh",
      "sudo /home/ec2-user/./setup.sh"
    ]
  }

  tags = {
    Name = "${var.name_prefix}_Boundary"
  }
}