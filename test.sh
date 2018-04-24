#!/bin/bash

#EasyVPN_Server.template


PROFILE=global_admin
BUCKET=leopublic
REGION=ap-southeast-1


FILES="EasyVPN_Server.template"


#https://s3-ap-southeast-1.amazonaws.com/leopublic/templates/EasyVPN/EasyVPN_Server.template

for F in $FILES; do
	KEY="templates/EasyVPN/$F"
	aws --profile $PROFILE s3 cp $F s3://$BUCKET/$KEY
	aws --profile $PROFILE s3api put-object-acl --bucket $BUCKET --key $KEY --grant-read 'uri="http://acs.amazonaws.com/groups/global/AllUsers"'

	echo "Upload done: https://s3-$REGION.amazonaws.com/$BUCKET/$KEY"
done
