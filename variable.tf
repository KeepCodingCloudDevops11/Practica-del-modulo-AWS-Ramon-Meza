# variables.tf
variable "bucket_name" {
  description = "practica-aws-ramonmeza-s3"
  type        = string
}

variable "region" {
  description = "La región de AWS donde se crea el bucket"
  type        = string
  default     = "eu-west-1"  # Puedes definir un valor predeterminado si lo deseas
}
