#Creates empty Device Collection
New-CMDeviceCollection -LimitingCollectionName 'All Desktop and Server Clients' -Name 'Test'

#Creates a custom User Client setting and sets the value
New-CMClientSetting -Name 'Admin User UDA Settings' -Type User
Set-CMClientSetting -Name 'Admin User UDA Settings' -AllowUserAffinity $true
#Creates custom User Client setting and sets the value and deploy it
New-CMClientSetting -Name 'Cloud Distribution Point Access' -Type User
Set-CMClientSetting -Name 'Cloud Distribution Point Access' -AllowCloudDistributionPoint $true -CloudService
Start-CMClientSettingDeployment -ClientSettingName 'Cloud Distribution Point Access' -CollectionName 'All Users'

#Distribute content to DP
Start-CMContentDistribution -ApplicationName 'Paint.net 4.0.21' -DistributionPointName 'CM01.SCHJOETT.LAB'
Start-CMContentDistribution -ApplicationName '7-Zip 18.01' -DistributionPointName 'CM01.SCHJOETT.LAB'
Start-CMContentDistribution -BootImageName 'Boot Image (x64)' -DistributionPointName 'CM01.SCHJOETT.LAB'
#Validate a distribution on the DP
Invoke-CMContentValidation -BootImageName 'Boot Image (x64)' -DistributionPointName 'CM01.schjoett.lab'

#Deploy applications
New-CMApplicationDeployment -Name 'Paint.net 4.0.21' -CollectionName 'All Windows 10 Clients'
New-CMApplicationDeployment -Name '7-Zip 18.01' -CollectionName 'All Windows 10 Clients'
#Deploy packages
Start-CMPackageDeployment -PackageName 'Notepad++ 7.5.6' -StandardProgramName 'Install - Notepad++ 7.5.6'´
-CollectionName 'All Windows 10 Clients' -DeployPurpose Available

#Create Distribution Point Group
New-CMDistributionPointGroup -Name 'SCHJOETT Lab DPs' -Description 'All DPs in the SCHJOETT ConfigMgr Lab'´
Add-CMDistributionPointToGroup -DistributionPointName 'CM01.schjoett.lab' -DistributionPointGroupName 'Schjoett Lab DPs'
#Associate a collection with a DP group
Add-CMUserCollectionToDistributionPointGroup -UserCollectionName 'All SCCM Admins' -DistributionPointGroupName 'Schjoett Lab DPs'
