
resource "aws_launch_configuration" "this" {
  name            = var.lg_name
  image_id        = var.ami_id
  instance_type   = var.instance_type
  security_groups = var.security_group_ids

  user_data       = var.user_data

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this" {
  launch_configuration = aws_launch_configuration.this.id
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.subnet_ids
  target_group_arns    = var.target_group_arns
  name                 = var.name

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [ aws_launch_configuration.this ]
}