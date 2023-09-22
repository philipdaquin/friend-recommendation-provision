resource "aws_apigatewayv2_api" "main" {
    name = "main"
    protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "staging" {
    api_id = aws_apigatewayv2_api.main.id

    name = "staging"
    auto_deploy = true
}
  