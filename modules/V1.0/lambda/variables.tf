variable "environment" {
	default = [{ key = "TERRAFORM_PLACEHOLDER", value = "1" }]
	type = list(object({
		key = string
		value = string
	}))
  description = "Ambiente de la lambda"
}
variable "excluded_files" {
	default = []
	type = list(string)
  description = "Archivos que quedan exclidos para no subir a la nube"
}
variable "handler" {
	type = string
  description = "funcion inicial de la lambda"
}
variable "memory_mb" {
	default = 128
	type = number
  description = "cantidad de memoria que usar a lambda"
	// * https://docs.aws.amazon.com/lambda/latest/dg/configuration-memory.html
	validation {
		condition = 128 <= var.memory_mb && var.memory_mb <= 10240
		error_message = "Variable 'ram_mb' must be between 128 - 10,240 MB."
	}
}
variable "name" {
	type = string
  description = "Nombre de la lambda"
}
variable "runtime" {
	type = string
  description = "Que lenguaje y version utilizara la lambda"
}
variable "source_directory" {
	type = string
  description = "directorio de la lambda"
}
variable "timeout_after_seconds" {
	default = 3
	type = number
  description = "Tiempo en el que la lambda responde un timeout"

	validation {
		condition = 0 <= var.timeout_after_seconds && var.timeout_after_seconds <= 900
		error_message = "Variable 'timeout_after_seconds' must be between 0 - 900 seconds."
	}
}