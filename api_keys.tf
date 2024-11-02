resource "aws_api_gateway_api_key" "jason" {
  
  name = "Jason Henrique"
  enabled = true
}

resource "aws_api_gateway_usage_plan" "jason" {
  
  name = "Health-API: Jason Henrique"

  throttle_settings {
    rate_limit = 1
    burst_limit = 10
  }

  quota_settings {
    limit = 100000
    period = "MONTH"
  }

  api_stages {
    api_id = aws_api_gateway_rest_api.health_api.id
    stage = aws_api_gateway_stage.health_api.stage_name
  }

}

resource "aws_api_gateway_usage_plan_key" "jason" {
  key_id = aws_api_gateway_api_key.jason.id
  key_type = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.jason.id
}