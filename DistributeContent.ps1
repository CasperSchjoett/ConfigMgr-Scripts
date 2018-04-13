#Distribute content to DP
Start-CMContentDistribution -ApplicationName 'Paint.net 4.0.21' -DistributionPointName 'CM01.SCHJOETT.LAB'
Start-CMContentDistribution -ApplicationName '7-Zip 18.01' -DistributionPointName 'CM01.SCHJOETT.LAB'
Start-CMContentDistribution -BootImageName 'Boot Image (x64)' -DistributionPointName 'CM01.SCHJOETT.LAB'
#Validate a distribution on the DP
Invoke-CMContentValidation -BootImageName 'Boot Image (x64)' -DistributionPointName 'CM01.schjoett.lab'