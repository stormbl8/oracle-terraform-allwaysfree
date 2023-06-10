/* Network */

resource "oci_core_virtual_network" "vcn01" {
  cidr_block     = "10.1.0.0/16"
  compartment_id = var.compartment_id
  display_name   = "VCN"
  dns_label      = "vcn"
}

resource "oci_core_subnet" "subnet_id" {
  cidr_block        = "10.1.20.0/24"
  display_name      = "subnet1"
  dns_label         = "subnet1"
  security_list_ids = [oci_core_security_list.security_list.id]
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_virtual_network.vcn01.id
  route_table_id    = oci_core_route_table.route_table.id
  dhcp_options_id   = oci_core_virtual_network.vcn01.default_dhcp_options_id
}

resource "oci_core_internet_gateway" "internet_gateway" {
  compartment_id = var.compartment_id
  display_name   = "IG"
  vcn_id         = oci_core_virtual_network.vcn01.id
}

resource "oci_core_route_table" "route_table" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.vcn01.id
  display_name   = "RouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }
}

resource "oci_core_security_list" "security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_virtual_network.vcn01.id
  display_name   = "SecurityList"

  egress_security_rules {
    protocol    = "6"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options { # port 22 allowed
      max = "22"
      min = "22"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options { # port 80 allowed
      max = "80"
      min = "80"
    }
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options { # port 443 allowed
      max = "443"
      min = "443"
    }
  }
}
