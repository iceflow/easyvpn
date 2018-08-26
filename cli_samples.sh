#!/bin/bash

validate_templates () {
	echo "Templates validation"
	for F in ${CHECK_FILES}; do
		echo "Check $F ......"
		aws cloudformation validate-template --template-body file://$F
		if [ $? -ne 0 ]; then
			echo "$F: Invalid format. Quit"
			exit 0
		fi
	done
}


server_setup() {
	## Setup EasyVPN Server in Seoul(Korea)
	aws --profile $PROFILE --region $REGION cloudformation create-stack  \
		--stack-name EasyVPNServer \
		--template-body file://EasyVPN_Server.yaml \
		--capabilities CAPABILITY_IAM  \
		--parameters \
			ParameterKey=InstanceType,ParameterValue=t2.micro \
			ParameterKey=KeyName,ParameterValue=[Your Keypari Name] \
			ParameterKey=VpcId,ParameterValue=[Your VPC ID] \
			ParameterKey=SubnetId,ParameterValue=[Your Public Subnet ID]

	## Check status
	aws --profile $PROFILE --region $REGION cloudformation list-stacks --output json --stack-status-filter CREATE_IN_PROGRESS

	## Get output
    aws --profile $PROFILE --region $REGION cloudformation describe-stacks --stack-name EasyVPNServer --output json --query 'Stacks[*].Outputs[*]'
}


client_setup() {
	## Setup EasyVPN Client in Ningxia(China)
	aws --profile $PROFILE --region $REGION cloudformation create-stack  \
		--stack-name EasyVPNClient \
		--template-body file://EasyVPN_Client.yaml \
		--parameters \
			ParameterKey=InstanceType,ParameterValue=t2.micro \
			ParameterKey=KeyName,ParameterValue=[Your Keypair Name] \
			ParameterKey=VpcId,ParameterValue=[Your VPC ID] \
			ParameterKey=SubnetId,ParameterValue=[Your Public SubnetID] \
			ParameterKey=VpcCIDR,ParameterValue=[Your choosen VPC CIDR] \
			ParameterKey=VPNServerIP,ParameterValue=[VPNServerIP from Server Output] \
			ParameterKey=PSK,ParameterValue=[PSK from Server Output]

	## Check status
	aws --profile $PROFILE --region $REGION cloudformation list-stacks --output json --stack-status-filter CREATE_IN_PROGRESS

}

### Main
CHECK_FILES="EasyVPN_Server.template EasyVPN_Client.template EasyVPN_Server.yaml EasyVPN_Client.yaml"
validate_templates

exit 0

PROFILE=global_admin
REGION=ap-northeast-2
server_setup

PROFILE=default
REGION=cn-northwest-1
#client_setup


exit 0


