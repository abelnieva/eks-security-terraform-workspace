# eks-security-terraform-workspace


Repositorio de ejemplo para el uso del módulo terraform-aws-eks-security-clusters


Este repositorio forma parte del proyecto [eks-security-framework](https://github.com/abelnieva/eks-security-framework)

Kown issues

* Bootstraping a private cluster may fail due at very begining , there are two possibles workarounds
    * Assing Terraform Cloud Agent to our workspace after the second run
    * Bootstraping the cluster with public endpoint, then setup the workspace to use agent. Later switch cluster to private endpoint
