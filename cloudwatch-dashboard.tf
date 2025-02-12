#TO FIX


resource "aws_cloudwatch_dashboard" "main_dashboard" {
  dashboard_name = "MainDashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric"
        x = 0
        y = 0
        width = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", aws_launch_template.template-app.id]
          ]
          period = 300
          stat = "Average"
          region = var.region-name
          title = "EC2 Instance CPU Utilization"
        }
      },
      {
        type = "metric"
        x = 0
        y = 6
        width = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/EC2", "FreeStorageSpace", "InstanceId", aws_launch_template.template-app.id]
          ]
          period = 300
          stat = "Average"
          region = var.region-name
          title = "EC2 Instance Free Storage Space"
        }
      }
    ]
  })
}