resource "azurerm_resource_group" "rg-demo2" {
  name = var.rg_name
  location = var.rg_location
  tags = {
    "Grupo" =  var.rg_group
  }
}

resource "azurerm_virtual_network" "vnet-demo2" {
  name = var.vnet_name
  address_space = var.vnet_address_space
  location = azurerm_resource_group.rg-demo2.location
  resource_group_name = azurerm_resource_group.rg-demo2.name  
}

resource "azurerm_subnet" "subnet-demo2" {
  name = var.subnet_name
  resource_group_name = azurerm_resource_group.rg-demo2.name
  virtual_network_name = azurerm_virtual_network.vnet-jenkins.name
  address_prefixes = var.subnet_address_prefixes
}
resource "azurerm_container_registry" "acr-demo2" {
  name = var.acr_name
  resource_group_name = azurerm_resource_group.rg-demo2.name
  location = azurerm_resource_group.rg-demo2.location
  sku = var.acr_sku
  admin_enabled = var.acr_admin_enabled  
}

resource "azurerm_kubernetes_cluster" "aks-demo2" {
  name = var.aks_name
  location = azurerm_resource_group.rg-demo2.location
  resource_group_name = azurerm_resource_group.rg-demo2.name
  dns_prefix = var.aks_dns_prefix
  kubernetes_version = var.aks_kubernetes_version
  role_based_access_control_enabled = var.aks_rbac_enabled
  service_principal {
    client_id = var.aks_sp_client_id
    client_secret = var.aks_sp_client_secret
  }
  network_profile {
    network_plugin = var.aks_net_plugin
    network_policy = var.aks_net_policy
  }
  default_node_pool {
    name = var.aks_np_name
    node_count = var.aks_np_node_count
    vm_size = var.aks_np_vm_size
    vnet_subnet_id = azurerm_subnet.subnet-demo2.id
    enable_auto_scaling = var.aks_np_enabler_auto_scaling
    max_pods = var.aks_np_max_pod_count
    min_count = var.aks_np_min_count
    max_count = var.aks_np_max_count
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "aksnp-demo2" {
  name = var.aksnp_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-demo2.id
  vm_size = var.aks_np_vm_size
  node_count = var.aksnp_node_count
}