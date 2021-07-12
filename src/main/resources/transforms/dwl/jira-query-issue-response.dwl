%dw 2.0
output application/json
fun  convertToString(state: Object) = do {
	var stateNum = state.content map (item, index) -> {
	  
      "comment": item.text
    
}
    ---
    stateNum.comment filter ((value) -> value != null) joinBy " "
}
---
{
	projectKey: payload.fields.project.key,
	summary: payload.fields.summary,
	description: payload.fields.description.content[0].content[0].text,
	issuetype: payload.fields.issuetype.name,
	priority: payload.fields.priority.name,
	sfdcCaseId: payload.fields.customfield_10030,
	status: payload.fields.status.statusCategory.name,
	owner: payload.fields.creator.displayName default "",
	lastUpdatedDate: payload.fields.statuscategorychangedate,
	comments: if (payload.fields.comment.comments[payload.fields.comment.maxResults-1].body.content !=null) convertToString((payload.fields.comment.comments[payload.fields.comment.maxResults-1].body.content) reduce($$ ++ $)) else "",
	externalComments: if (payload.fields.comment.comments[payload.fields.comment.maxResults-1].body.content !=null) convertToString((payload.fields.comment.comments[payload.fields.comment.maxResults-1].body.content) reduce($$ ++ $)) else "",
	externalStatus: payload.fields.status.statusCategory.name,
	externalSystemLastUpdated: payload.fields.statuscategorychangedate,
	externalOwner: payload.fields.creator.name default "",
	externalPriority: payload.fields.priority.name
}