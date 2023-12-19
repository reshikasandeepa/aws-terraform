output "eip_id" {
    description  = "The ID of the created EIP" 
    value = aws_eip.eip.id
    
}