#!/bin/bash
echo "AWS CLI profiles:"
aws configure list-profiles
echo ""
read -p "enter profile: " profile
read -p "enter region: " region
read -p "enter how many minutes you want to retrieve (e.g. 5 or 10): " minutes

# On Linux
START_TIME=$(date -u --date "$minutes minutes ago" '+%Y-%m-%dT%H:%M:%SZ')
# On a Mac, per Michael Speer, Xpertloop (I haven't tested this as I do not install the AWS CLI locally)
#START_TIME=$(date -u -v-${minutes}M'+%Y%m-$dT%H:%M:%SZ')

echo ""
echo "CLOUDTRAIL ERRORS ONLY"
echo ""
aws cloudtrail lookup-events \
    --start-time "$START_TIME" \
    --profile $profile \
    --region $region \
    --output json | jq '.Events[] | select(.CloudTrailEvent | fromjson.errorCode) | .CloudTrailEvent |= fromjson'
