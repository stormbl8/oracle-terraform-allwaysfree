hostname                = "" # must be defined

#Authentication
tenancy_id              = ""

#Compartment
compartment_id          = ""

#Instance Shape
#instance_shape         = "VM.Standard.A1.Flex" # memory can be 1 - 24 / cpu can be 1 - 4
instance_shape          = "VM.Standard.E2.1.Micro"

boot_volume_size_in_gbs = "100"

memory_in_gbs           = "1"

ocpus                   = "1"

operating_system        = "Canonical Ubuntu" #Oracle Linux 8 or Canonical Ubuntu

operating_system_version = "22.04" # 20.04 / 22.04 / 8 for Oracle
