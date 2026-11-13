
output "vpc_id" {
  value       = module.vpc-child.vpc_id
  description = "The ID of the created VPC"
}

output "public_subnet_ids" {
  value       = module.vpc-child.public_subnet_ids
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = module.vpc-child.private_subnet_ids
  description = "List of private subnet IDs"
}

output "public_subnet_map" {
  value       = module.vpc-child.public_subnet_map
  description = "Map of AZ to Public Subnet ID"
}
