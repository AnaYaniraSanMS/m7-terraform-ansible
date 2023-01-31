variable "rg_name" {}
variable "rg_group" {}
variable "rg_location" {}

//vnet
variable "vnet_name" {}
variable "vnet_address_space" {}
//subnet
variable "subnet_name" {}
variable "subnet_address_prefixes" {}

//acr
variable "acr_name" {}
variable "acr_sku" {}
variable "acr_admin_enabled" {}

//aks-demo
variable "aks_name" {}
variable "aks_dns_prefix" {}
variable "aks_kubernetes_version" {}
variable "aks_rbac_enabled" {}

//service_principal
variable "aks_sp_client_id" {}
variable "aks_sp_client_secret" {}

//network_profile
variable "aks_net_plugin" {}
variable "aks_net_policy" {}

//node_pool
variable "aks_np_name" {}
variable "aks_np_node_count" {}
variable "aks_np_enabler_auto_scaling" {}
variable "aks_np_max_pod_count" {}
variable "aks_np_min_count" {}
variable "aks_np_max_count" {}

// aksnp
variable "aksnp_name" {}
variable "aksnp_node_count" {}