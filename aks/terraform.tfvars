rg_name = "diplo-asanmartin-g6"
rg_group = 6
rg_location ="eastus2"

//vnet
vnet_name = "vnet_asanmartin"
vnet_address_space = ["12.0.0.0/16"]
//subnet
subnet_name = "internal"
subnet_address_prefixes = ["12.0.0.0/20"]

//acr
acr_name = "acr_asanmartin"
acr_sku = "Basic"
acr_admin_enabled = true

//aks
aks_name = "aks_asanmartin"
aks_dns_prefix = "aks1"
aks_kubernetes_version = "1.24.6"
aks_rbac_enabled = true

//service_principal
aks_sp_client_id = "ehd738bc-j824-44e2-a559-4bef2ea94254"
aks_sp_client_secret = "************"

//network_profile
aks_net_plugin = "azure"
aks_net_policy = "azure"

//node_pool
aks_np_name = "default"
aks_np_node_count = 1
aks_np_vm_size = "Standard_D2_v2"
aks_np_enabler_auto_scaling = true
aks_np_max_pod_count = 80
aks_np_min_count = 1
aks_np_max_count = 1

// aksnp
aksnp_name = "internal"
aksnp_node_count = 1