module "subnet_bastion" {
  source  = "claranet/subnet/azurerm"
  version = "4.2.0"

  environment    = var.environment
  location_short = var.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name  = coalesce(var.network_resource_group_name, var.resource_group_name)
  virtual_network_name = var.virtual_network_name

  subnet_cidr_list = [var.subnet_bastion_cidr]

  # Fixed name, imposed by Azure
  custom_subnet_name = "AzureBastionSubnet"

  # No NSG because the Bastion needs to generates its own rules
  network_security_group_name = null

  # No RTB because the Bastion needs to generates its own routes and propagate them
  route_table_name = null
}
