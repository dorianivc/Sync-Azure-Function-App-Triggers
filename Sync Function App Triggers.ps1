#Sync Function App Triggers#Developed by Dorian Vallecillo Calderon(dorianivc1@gmail.com/v-dovall@microsoft.com)#Please fill the Subscription ID between the quotes$sub="<your-subscription-id>"
#Please fill the Resource Group name between the quotes
$rg="<your-resource-group-name>"
#Please fill the Function App name between the quotes
$fa="<your-function-app-name>"
az account set --subscription $sub
$Bearer=$(az account get-access-token| ConvertFrom-Json |  Select accessToken).accessToken
$endpoint="https://management.azure.com/subscriptions/"+$sub+"/resourceGroups/"+$rg+"/providers/Microsoft.Web/sites/"+$fa+"/syncfunctiontriggers?api-version=2019-08-01"
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer "+$Bearer)
$response = Invoke-RestMethod $endpoint -Method 'POST' -Headers $headers
$response | ConvertTo-Json