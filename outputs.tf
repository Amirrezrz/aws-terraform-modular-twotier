output "final_web_public_ip" {
  value       = module.Servers.web_public_ip
  description = "The public IP of our modular Nginx web server"
}
