
##  INSTRUCTIONS TO RUN THE APPLICATION
STEP 1. Install AWS CLI in the local terminal with the necessary user access.


STEP 2. Configure AWS CLI for CodeCommit.


STEP 3. Create the IAM role with the following permissions.  
a. AmazonS3FullAccess  
b. AmazonAPIGatewayInvokeFullAccess  
c. CloudWatchFullAccess  
d. AmazonDynamoDBFullAccess  
e. AWSLambdaExecute  
f. AmazonElasticFileSystemFullAccess  
g. AWSLambdaVPCAccessExecutionRole  
h. AmazonElasticFileSystemClientFullAccess  


STEP 4. Create an EFS with all the dependency files and mount it in 

` “/mnt/efs” ` through EC2.


STEP 5. Create a lambda layer with the dependency files of bcryptjs and jsonwebtoken.


STEP 6. In the local terminal, run the command 

`“npm install -g serverless.”`


STEP 7. In the local terminal, run the command, 

`“sls create -t aws-nodejs -p ”`


STEP 8. Run  `“npm init -y”`


STEP 9. Run  `“npm install”`


STEP 10. Open the terminal from the project location
a. To test offline, continue these steps.

i. Run `“npm install serverlessoffline” ` in the project folder.

ii. Run  `“sls offline”`
 
iii. Use the endpoint generated in postman


STEP 11. Create a CodeCommit repository in AWS


STEP 12. Run `“git init”`


STEP 13. Run `“git add .”`


STEP 14. Run `“git commit -am “first commit”.`


STEP 15. Run `“git remote add origin ”.`


STEP 16. Run `“git push --set-upstream origin.”`


STEP 17. Create a pipeline with the below steps .


STEP 18. Add CodeCommit as a repository.


STEP 19. Create a CodeBuild using environment variables as “buildspec.yml” and ENV_NAME=prodenv”.


STEP 20. Select “skip stage” in the deployment stage, as it’s serverless.


STEP 21. CodePipeline starts building, and an endpoint will be generated for the application.


STEP 22. Add the data sets to the S3 bucket created.