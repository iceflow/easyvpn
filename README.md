# EasyVPN
Fast ways to setup VPN connections ( Do not use it in a commercial way )

![EasyVPN Architedcture](images/EasyVPNArch.png)

## Objectives
  - [X] 1. CloudFormation template - Json format : 2018/04/28
  - [X] 2. CloudFormation template - YAML format : 2018/04/30
  - [X] 3. CloudFormation template - WebConsole support : 2018/04/28
  - [ ] 4. CloudFormation template - CLI support
  - [ ] 5. CloudFormation template - Python3 support
  - [ ] 6. Terraform format support
  - [ ] 7. Docker support
  
## Manual
### 1. CloudFormation template
 - EasyVPN Server Setup
    - Support regions: Tokyo, Seoul
    - Server Template: 
    
	AWS Region   | JSON Format  | YAML Format 
	------------ | ------------ | ------------
	Tokyo | [Launch JSON](https://console.aws.amazon.com/cloudformation/home?region=ap-northeast-1#/stacks/new?stackName=EasyVPNServer&amp;templateURL=https://s3-ap-southeast-1.amazonaws.com/leopublic/templates/EasyVPN/EasyVPN_Server.template) | [Launch YAML](https://console.aws.amazon.com/cloudformation/home?region=ap-northeast-1#/stacks/new?stackName=EasyVPNServer&amp;templateURL=https://s3-ap-southeast-1.amazonaws.com/leopublic/templates/EasyVPN/EasyVPN_Server.yaml)
	Seoul | [Launch JSON](https://console.aws.amazon.com/cloudformation/home?region=ap-northeast-2#/stacks/new?stackName=EasyVPNServer&amp;templateURL=https://s3-ap-southeast-1.amazonaws.com/leopublic/templates/EasyVPN/EasyVPN_Server.template) | [Launch YAML](https://console.aws.amazon.com/cloudformation/home?region=ap-northeast-2#/stacks/new?stackName=EasyVPNServer&amp;templateURL=https://s3-ap-southeast-1.amazonaws.com/leopublic/templates/EasyVPN/EasyVPN_Server.yaml) 
	- Select public subnet
    - Get VPNServerIP, PSK from the output after completed launch
 - EasyVPN Client Setup
    - Support regions: Beijing, Ningxia
    - Client Template: 
	
	AWS Region   | JSON Format  | YAML Format 
	------------ | ------------ | ------------
	China Ningxia | [Launch JSON](https://console.amazonaws.cn/cloudformation/home?region=cn-northwest-1#/stacks/new?stackName=EasyVPNClient&amp;templateURL=https://s3.cn-north-1.amazonaws.com.cn/leopublic/templates/EasyVPN/EasyVPN_Client.template) | [Launch YAML](https://console.amazonaws.cn/cloudformation/home?region=cn-northwest-1#/stacks/new?stackName=EasyVPNClient&amp;templateURL=https://s3.cn-north-1.amazonaws.com.cn/leopublic/templates/EasyVPN/EasyVPN_Client.yaml)
	China Beijing | [Launch JSON](https://console.amazonaws.cn/cloudformation/home?region=cn-north-1#/stacks/new?stackName=EasyVPNClient&amp;templateURL=https://s3.cn-north-1.amazonaws.com.cn/leopublic/templates/EasyVPN/EasyVPN_Client.template) | [Launch YAML](https://console.amazonaws.cn/cloudformation/home?region=cn-north-1#/stacks/new?stackName=EasyVPNClient&amp;templateURL=https://s3.cn-north-1.amazonaws.com.cn/leopublic/templates/EasyVPN/EasyVPN_Client.yaml)
    - Select public subnet
 - Modify related routing tables in the Client VPC
 - Test from the Client subnets




