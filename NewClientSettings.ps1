#Creates a custom User Client setting and sets the value
New-CMClientSetting -Name 'Admin User UDA Settings' -Type User
Set-CMClientSetting -Name 'Admin User UDA Settings' -AllowUserAffinity $true
#Creates custom User Client setting and sets the value and deploy it
New-CMClientSetting -Name 'Cloud Distribution Point Access' -Type User
Set-CMClientSetting -Name 'Cloud Distribution Point Access' -AllowCloudDistributionPoint $true -CloudService
Start-CMClientSettingDeployment -ClientSettingName 'Cloud Distribution Point Access' -CollectionName 'All Users'