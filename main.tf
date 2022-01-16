provider "google" {
  credentials = "advance-elixir-.json"
  project = "{{advance-elixir-33666}}"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    access_config {
    }
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}


#these are the configuration and deti of the workload;
#1 provider= represent of which cloud provider we are going to use for example gcp , aws, azure.
#2 credentials= represent of access to the cloud provider to deploy , thats known as a json file
#3 project id= shows what is the name we given to the peoject
#4 region and zone= represents of location for the resources to be created in all zones are part of a region
#5 resources= what is work load has to be done need to mention it, Are what kind of work load.
#6 name= what is the name we giving to workload are to identify which instancesare we creating.
#7 machine type = machine type provides virtual hardware resource by virtual cpu f1 micro is a cost efficient and work well with small workload.
#8 boot disk = boot disk is like rom to the instances , we can specify the type standard or ssd and size of the disk.
#9 image = shows which operating system to create boot disk for instances, example it could be linux, windows.
#10 network interface = every instance has a vpc network in single network interface, each different vpc network has each interface belongs to subnet.
#11 subnet = subment is piece of a larger network. internet is the method of sending data from one computer to another,
# it get access through ip address as a unique identifier . 
