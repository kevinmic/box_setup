#!/usr/bin/env bash
  
if [ "$1" = "lab" ]; then
        role="arn:aws:iam::ACCOUNT_ID:role/ROLE_ID"
        echo "SETTING AWS LAB CREDS"
fi

if [ -z "$role" ]; then
        echo "Environment not specified"
else
        json=`aws sts assume-role --role-arn "$role" --profile PROFILE --role-session-name SESSION_NAME`

        accessKey=`echo $json | jq -r ".Credentials.AccessKeyId"`
        secretKey=`echo $json | jq -r ".Credentials.SecretAccessKey"`
        sessionToken=`echo $json | jq -r ".Credentials.SessionToken"`

        export AWS_ACCESS_KEY_ID=$accessKey
        export AWS_SECRET_ACCESS_KEY=$secretKey
        export AWS_SESSION_TOKEN=$sessionToken
fi
