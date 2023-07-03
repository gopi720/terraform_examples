variable "vpc_cidrblock"{
    type =string 
    default="10.0.0.0/16"
}
variable "subnet_cidrblock"{
    type = string
    default= "10.0.1.0/24"
}
variable "public_key"{
    type = string
    default= "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVTpswf4a46m86PROkVSFNbI+hQ4pEf34U/QxS4d1qNOM/pS2FZuoZPwAQAJIO87NzD9dN7+ezaREXOS1YhAy+JP11IVKIHfHFn0OBPUc6KcSFxWURf4VdpL/Fu14rcIZgb/lokNjVZvrNVk3xac2Af8jk5BzlkRT5B/4i81oqV/eU1XYZCiqkMirmNPQROdhWf5HbjkOnlALQ5OcrswC3AqdOqJt3y0bk0IdFc0QBQTLt6hE/yiBx5BKQ8KDa9d+5ZMMHJSYvnOWTFdCEeEjVo2jL7yyoiESpWgYWoOA0sOecKECsR9vpaP9JgnzVk/ef2myy2uMTNQ4zgbbEvHso02gbE8MSqLfxV6mDeI83sPc2CTovJo5IzLJtyPebshjtP2nZXGvXJfER/BCJcCH45G6abiXNEKxONOux2vynLGbGM+R8Ja5ZInhDbUZjJEM17v1FKxUf1BSpWm4aSKDiUDoMAoNBgqY66pRxCStaOy7jy8htPindC88J4ZTR0i0= dvnr9@SRILikkiMokshi"
}
variable "access_key"{
    type= string
    default= "AKIAYKNWRPJJXFYHOMCM"
}
variable "secret_key"{
    type= string
    default= "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"
}