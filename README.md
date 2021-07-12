# jira-sys-api

This is a System API.
Issue Create-This API is used to create JIRA issue in the respective project using project key.Post method /issue is implemented to create Issue.Project Key is mandatory field as this is used to determine underlying project the issue needs to be created.Priority field maps to 1->High,3->Medium,4->Low.Default issue type is Bug unless it is overidden by the client of this API.
Query Issue-This API is used query issue using the issue id.This API uses JIRA REST APIs to connect to JIRA.Get method issue/{issueId) is implemented to query the issue details with the issue id.The response format is JSON.
# Prerequisite Setup

 - Get the JIRA API key for the respective JIRA instance and encode as base64 in format username:apikey  to pass in Authorization header.Encrypt the base64 encoded token and add it the {env}-secure.yaml file under respective property.Where env is LOCAL,DEV
 - Create the following custom field under respective project.
       SFDC CASE ID
 - Update the custom field internal reference in jira-issue-request.dwl.The field name will be in this format "customfield_10027"
 - Update the custom field internal reference in jira-query-issue-response.dwl.The field name will be in this format "customfield_10027"
 

# Installation Instructions For Studio


- Clone the project using any Github client or Anypoint Studio Git plugin.
- Import the project into workspace.
- Modify LOCAL.yaml properties appropriately.
- Studio --> Right Click  on Project --> Run As --> Run Configurations , Navigate to Arguments tab, in VM arguments enter the following

           
           -M-Dmule.env=LOCAL
           -M-DencryptionKey=(use your encryptionKey) 
           -M-Danypoint.platform.gatekeeper=disabled
           -M-Djira-auth.token=(Use JIRA Auth Token)
           
           
- Click on Apply Button.
- Run the project.

# Deployment Instructions For CH

- API Manager:
     
     Refer here to create API definition: [accelerator-documentation/files/api-config.md](https://github.com/mulesoft-labs/accelerator-documentation/blob/master/files/api-config.md)
- Runtime Manager :

     Use the following Maven command to deploy application to Cloud Hub, replace '**' with appropriate values
   
mvn clean package deploy -DskipMunitTests -DmuleDeploy -DmuleVersion=** -Dusername=** -Dpassword=** -DapplicationName=** -Denvironment=** -DbusinessGroup=** -DworkerType=** -Danypoint.platform.client_id=** -Danypoint.platform.client_secret=** -DencryptionKey=** -Danypoint.platform.visualizer.layer=system -Djira-auth.token="**"

