output "public-ip" {
    value = azurerm_public_ip.pip-jenkins.ip_address
}