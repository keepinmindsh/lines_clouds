# ARN ( Amazon Resource Number)

AWS 는 Amazon Resource Number 의 약자로 우리가 람다함수를 생성할 때 EC2를 생성할 때 생성되는 일련번호입니다. 
AWS 에는 각각의 서비스에서 만든 리소스들은 ARN 으로 구분하고 ARN 이 다르다면 서로 다르게 취급합니다. 

- AWS 의 리소스를 고유하게 식별하기 위해 사용하는 것 
- 태그, API 호출과 같은 모든 AWS 리소스를 지정해야할 필요가 있는 경우 ARN을 사용한다. 

ARN/파티션구분자/서비스명/리전/계정번호 + 서비스마다의 상세 구분자

- arn:aws:lambda:region:account-id:function:function-name

> 파티션 구분자에 AWS가 있는 이유는 중국에 AWS콘솔과 독립적인 서비스가 있기 때문입니다. 
> 이 서비스의 경우 arn:aws-ch 로 시작합니다. 미국 정부 역시 AWS를 사용하고 있는데 
> 보안상의 이유로 독립된 파티션 구분자를 갖습니다. 

구체적인 혀익은 리소스에 따라 다릅니다. ARN 을 사용하려면 아래의 텍스트를 리소스 별로 정보로 바꿉니다.  
일부 리소스의 ARN 에서는 리전, 계정 ID 또는 리전과 계정 ID 가 모두 생략됩니다.

```
arn:partition:service:region:account-id:resource-id
arn:partition:service:region:account-id:resource-type/resource-id
arn:partition:service:region:account-id:resource-type:resource-id
```

### partition 

리소스가 있는 파티션입니다. 파티션은 AWS 리전의 그룹입니다. 각 AWS 계정은 하나의 파티션으로 범위가 지정됩니다.  

- aws - AWS 리전 
- aws-cn - 중국 리전 
- aws-us-gov - AWS GovCloud (US) 리전 

### service 

AWS 제품을 식별하는 서비스 네임스페이스입니다. 

### region 

리전코드, 예를 들어 미국 동부의 경우 us-east-2 입니다. 리전 코드 목록은 AWS 일반 참조의 리전 엔드포인트를 참조할 것 

### account-id 

리소스를 소유한 AWS 계정의 ID입니다. 

### resource-type 

리소스 유형입니다. Virtual Private Cloud의 vpc 를 예로 들 수 있습니다. 

### resource-id 

리소스 식별자 입니다. 리소스의 이름, 리소스의 ID 또는 리소스 경로입니다. 일부 리소스 식별자에는 상위 리소스 또는 
버전과 같은 식별자를 포함할 수 있습니다.  

``` 
IAM 사용자   
arn:aws:iam::123456789012:user/johndoe
SNS 주제   
arn:aws:sns:us-east-1:123456789012:example-sns-topic-name
VPC   
arn:aws:ec2:us-east-1:123456789012:vpc/vpc-0e9801d129EXAMPLE
```

> [ARN](https://docs.aws.amazon.com/ko_kr/IAM/latest/UserGuide/reference-arns.html)       
> [AWS - ARN 이란?](https://galid1.tistory.com/387)    