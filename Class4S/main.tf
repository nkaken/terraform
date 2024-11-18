# resource "aws_instance" "cluster" {
#   count         = 1
#   ami           = "ami-0dcc1e21636832c5d"
#   instance_type = "m5.large"

#   # ...
# }

resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  # triggers = {
  #   cluster_instance_ids = join(",", aws_instance.cluster[*].id)
  # }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  # connection {
  #   host = element(aws_instance.cluster[*].public_ip, 0)
  # }

  provisioner "local-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    # inline = [
    #   "bootstrap-cluster.sh ${join(" ",
    #   aws_instance.cluster[*].private_ip)}",
    # ]
    command = "mkdir kaizen && touch testfile"
  }
}