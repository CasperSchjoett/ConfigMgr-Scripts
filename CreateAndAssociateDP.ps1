#Create Distribution Point Group
New-CMDistributionPointGroup -Name 'SCHJOETT Lab DPs' -Description 'All DPs in the SCHJOETT ConfigMgr Lab'´
Add-CMDistributionPointToGroup -DistributionPointName 'CM01.schjoett.lab' -DistributionPointGroupName 'Schjoett Lab DPs'
#Associate a collection with a DP group
Add-CMUserCollectionToDistributionPointGroup -UserCollectionName 'All SCCM Admins' -DistributionPointGroupName 'Schjoett Lab DPs'