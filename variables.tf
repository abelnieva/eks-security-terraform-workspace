variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Default AWS region variable"
}

variable "kubescape_account_id" {
  type        = string
  default     = ""
  description = "token to connect kubescape"

}
variable "tfc_agent_token" {
  type        = string
  default     = ""
  description = "token to connect terraform cloud"

}
