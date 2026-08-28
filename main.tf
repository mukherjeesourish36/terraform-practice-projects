module "dev_infra" {
    source = "./infra_app"
    env = "dev"
    bucket-name = "infra-app-bucket"
    instance-count = 1
    instance-type = "t3.micro"
    ami-id = "ami-06475e8f54266e38e"
    hash_key = "studentID"
}

module "prd_infra" {
    source = "./infra_app"
    env = "prd"
    bucket-name = "infra-app-bucket"
    instance-count = 2
    instance-type = "c7i-flex.large"
    ami-id = "ami-06475e8f54266e38e"
    hash_key = "studentID"
}

module "stg_infra" {
    source = "./infra_app"
    env = "stg"
    bucket-name = "infra-app-bucket"
    instance-count = 1
    instance-type = "t3.small"
    ami-id = "ami-06475e8f54266e38e"
    hash_key = "studentID"
}