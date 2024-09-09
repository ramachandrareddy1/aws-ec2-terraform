resource "aws_autoscaling_policy" "avg_cpu_policy_greater_than_xx" {
  name = "${local.name}-avg-cpu-policy-greater-than-xx"
  policy_type = "TargetTrackingScaling" 
  autoscaling_group_name = aws_autoscaling_group.my_asg.id 
  estimated_instance_warmup = 180 
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }  
 
}

resource "aws_autoscaling_policy" "alb_target_requests_greater_than_yy" {
  name = "${local.name}-alb-target-requests-greater-than-yy"
  policy_type = "TargetTrackingScaling" 
  autoscaling_group_name = aws_autoscaling_group.my_asg.id 
  estimated_instance_warmup = 120   
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      #resource_label =  "${module.alb.lb_arn_suffix}/${module.alb.target_group_arn_suffixes[0]}"    
      resource_label =  "${module.alb.arn_suffix}/${module.alb.target_groups["mytg1"].arn_suffix}"  # UPDATED NOV2023      
    }  
    target_value = 10.0
  }    
}

output "asg_build_resource_label" {
  value =  "${module.alb.arn_suffix}/${module.alb.target_groups["mytg1"].arn_suffix}"  
}