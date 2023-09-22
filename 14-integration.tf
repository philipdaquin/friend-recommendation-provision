resource "aws_security_group" "vpc_link" {
    name = "vpc-link"
    vpc_id = aws_vpc.main.id

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_apigatewayv2_vpc_link" "eks" {
    name = "eks"
    security_group_ids = [aws_security_group.vpc_link.id]
    subnet_ids = [
        aws_subnet.private_zone1.id,
        aws_subnet.private_zone2.id
    ]
}

resource "aws_apigatewayv2_integration" "integration" {
    api_id = aws_apigatewayv2_api.main.id

    // Loadbalancer Listener URI
    integration_uri = ""
    
    integration_method = "ANY"
    integration_type = "HTTP_PROXY"

    connection_type = "VPC_LINK"
    connection_id = aws_apigatewayv2_vpc_link.eks.id 
}

// Test 
resource "aws_apigatewayv2_route" "echo" {
    api_id = aws_apigatewayv2_api.main.id
    route_key = "GET /echo"
    target = "integrations/${aws_apigatewayv2_integration.integration.id}"
}


output "hello_world" {
    value = "${aws_apigatewayv2_stage.dev.invoke_url}/echo"
}