# view-cloudtrail-errors
View all the errors using an AWS CLI profile for the last X minutes

I don't know why AWS does not make it easier to view errors in the AWS Console. I would like to be able to filter the AWS CloudTrail event history for records with errors.

Also, when you're working with a script that uses multiple AWS Profiles sometimes you want a quick way to query all the errors in different accounts and regions using different profiles. That's why I created this script.

Enter the profile you want to use to query the events, the region, and the number of minutes you want to query.

Remember that there when querying AWS CloudTrail so you might need to wait a few minutes for the events to show up depending on your CloudTrail configuration. 

This query currently only looks at wahtever the cloudtrail lookup-events command returns. 
