#Deploy applications
New-CMApplicationDeployment -Name 'Paint.net 4.0.21' -CollectionName 'All Windows 10 Clients'
New-CMApplicationDeployment -Name '7-Zip 18.01' -CollectionName 'All Windows 10 Clients'
#Deploy packages
Start-CMPackageDeployment -PackageName 'Notepad++ 7.5.6' -StandardProgramName 'Install - Notepad++ 7.5.6'´
-CollectionName 'All Windows 10 Clients' -DeployPurpose Available