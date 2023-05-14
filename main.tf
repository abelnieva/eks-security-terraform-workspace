
data "tfe_ip_ranges" "addresses" {}

data "http" "terraform_cloud_ip" {
  url = "http://ipv4.icanhazip.com"

  request_headers = {
    Accept = "text/html"
  }
  
}


module "cluster_infra" {
  source                               = "app.terraform.io/security-framework/eks-security-clusters/aws"
  version                              = "0.0.1"
  cluster_name                         = "test-cluster"
  vpc_cidr                             = "10.0.0.0/16"
  cluster_endpoint_public_access       = true
  #cluster_endpoint_public_access_cidrs = ["${trim(data.http.terraform_cloud_ip.body,"\n")}/32"]
  ecr_repos_list                       = ["testrepo"]
  dev_teams = {
    dev_1_team = {
      users = ["arn:aws:iam::481020473208:user/terraform"] #arns
      namespaces = {
        default = {
          # Provides access to an existing namespace
          create = false
        }
      }
    }
  }
  kubescape_account_id = var.kubescape_account_id //sensible
  repo_apps_url        = "git@github.com:abelnieva/eks-security-framework-apps.git"
  repo_apps_path       = "./"
  dns_zones            = []
  managed_node_groups = {
    node_group_a = {
      min_size = 1

      max_size           = 10
      desired_size       = 3
      launch_template_os = "bottlerocket"
      ami_type           = "BOTTLEROCKET_x86_64"
      instance_types     = ["t3.large"]
      capacity_type      = "SPOT"

      update_config = {
        max_unavailable_percentage = 33 # or set `max_unavailable`
      }

      tags = {
        ExtraTag = "example"
      }
    }
  }
} 