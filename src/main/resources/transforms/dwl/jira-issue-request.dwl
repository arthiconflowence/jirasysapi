%dw 2.0
output application/json
---
{
    "fields": {
       "project":
       {
          "key": payload.projectKey
       },
       "summary": payload.summary,
       "description": payload.description,
       "issuetype": {
          "name": payload.issuetype default "Bug"
       },
       "priority": {
       "id": payload.priority default "1"
       },
       "customfield_10030":payload.sfdcCaseId
       
       
   }
}