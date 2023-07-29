# AWS Terraform 

> [AWS Terrafrom](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build)

## Prerequisites 

환경 변수에 아래의 값을 정의해서 사용할 수 있고, 

```shell
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

terraform 내에서 환경 변수를 파일로 경로를 로드할 수 있다. 

```yaml 
provider "aws" {
  region  = "ap-northeast-2"
  shared_config_files = ["/Users/howard/.aws/config"]
  shared_credentials_files = ["/Users/howard/.aws/credentials"]
  profile = "default"
}
```

## Command Line 

> [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#network-and-credit-specification-example](#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#network-and-credit-specification-example)

```shell
terraform init 

terraform validate 

terraform apply 

```

- To Change 

```shell 
terraform init

terrafrom apply 
```

- To Destroy 

```shell
terraform destroy
```

## AWS Provider 

### Index 

- [Elastic Cache](#elastic-cache)


### Elastic Cache

> [Elastic Cache](#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster)

### Module 사용법 

> [TF Module Use](https://developer.hashicorp.com/terraform/tutorials/modules/module-use)