
module "cluster_infra" {
  source                         = "abelnieva/eks-security-clusters/aws"
  version                        = "0.0.10"
  cluster_name                   = "demo-cluster"
  vpc_cidr                       = "10.0.0.0/16"
  ssh_public_key                 = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCrS3CYVw9tqM18WJIi4XVOgKbuh0BV/sJe1fRq8E1r+IorSRBwH6H5kAg0zEODdXnLDD3YnZOs4SG5WTEuNtO7AsGuaKRe1aIyxOsTBoyEY+JcNbCj76Z5ISven3LQj6AeUbGTDG6VA9gE6F3EwmD9Ip3vjRDzrlkG/XIs1URtMlFXfFrEemCeNuuw50MQA2VcY4HVpZYI3gNZY1iufwPMlSDDoqTShOhqJZDh5QxhdGvwKjnISOMgjbELnANeaaeP9DQzyzMSI9Y4u65anBII1afn6cnqpBgBM52A8iLi8SeCmyyYGoCv+H3/bQTv1z1KUiqIsc1mVy3eNYD6olPy9REslGpJwd4huEmkKou7BA7NWS5k/EBg78XC8KSL8vZSrYvWiiCjz7YG0pUP14O6/Gn5b1aYtsTTNvNsZo6R6IIzn8jA+RPYdKEU8dSKMp4+A9EY3KBUhfbtgc+bGwyQYEIJBhidmrZc9oip8/JngQYcogP7jEuG0DH3i69+OHs= abelnieva@abels-MBP.home"
  cluster_endpoint_public_access = true
  tfc_agent_token                = var.tfc_agent_token
  tfc_agent_instance_type        = "t3.large"
  ecr_repos_list                 = ["testrepo"]
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
  kubescape_account_id = var.kubescape_account_id
  repo_apps_url        = "https://github.com/abelnieva/eks-security-framework-apps.git"
  repo_apps_path       = "teams/dev_1_team/dev"
  dns_zones            = []
  managed_node_groups = {
    node_group_a = {
      min_size = 1

      max_size           = 10
      desired_size       = 4
      launch_template_os = "bottlerocket"
      ami_type           = "BOTTLEROCKET_x86_64"
      instance_types     = ["t3.xlarge"]
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
