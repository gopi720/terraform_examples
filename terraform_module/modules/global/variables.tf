variable "region" {
  type = string
  default = "ap-south-1"
}
variable "profile" {
  type = string
  default = "default"
}
variable "vpccidr" {
  type = string
}
variable "subnet_cidrblock" {
  type = string
}
variable "ami" {
  type = string
  default = "ami-07ffb2f4d65357b42"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "public_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVTpswf4a46m86PROkVSFNbI+hQ4pEf34U/QxS4d1qNOM/pS2FZuoZPwAQAJIO87NzD9dN7+ezaREXOS1YhAy+JP11IVKIHfHFn0OBPUc6KcSFxWURf4VdpL/Fu14rcIZgb/lokNjVZvrNVk3xac2Af8jk5BzlkRT5B/4i81oqV/eU1XYZCiqkMirmNPQROdhWf5HbjkOnlALQ5OcrswC3AqdOqJt3y0bk0IdFc0QBQTLt6hE/yiBx5BKQ8KDa9d+5ZMMHJSYvnOWTFdCEeEjVo2jL7yyoiESpWgYWoOA0sOecKECsR9vpaP9JgnzVk/ef2myy2uMTNQ4zgbbEvHso02gbE8MSqLfxV6mDeI83sPc2CTovJo5IzLJtyPebshjtP2nZXGvXJfER/BCJcCH45G6abiXNEKxONOux2vynLGbGM+R8Ja5ZInhDbUZjJEM17v1FKxUf1BSpWm4aSKDiUDoMAoNBgqY66pRxCStaOy7jy8htPindC88J4ZTR0i0= dvnr9@SRILikkiMokshi"
}
variable "key_name" {
    type = string
    default = "gopi"
}
