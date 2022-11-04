param(
    [string]
    $Resourcegroupname
)
$WorkSpace = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.Purview/accounts
$WorkSpacename = $WorkSpace.Name
$TakeEndpoint = 'https://'+$WorkSpacename+'.purview.azure.com'

$DataSource = Get-AzPurviewDataSource -Endpoint $TakeEndpoint
foreach($Source in $DataSource)
{
    if($Source.kind -like "AdlsGen2")
    {
        $Adlssource = $Source.name
    }
}
$DataSourceValidate = Get-AzPurviewDataSource -Endpoint $TakeEndpoint -Name $Adlssource
if($DataSourceValidate){
    Write-Host "ADLS Gen2 Account is Registered"
}
else{
    Write-Host "ADLS Gen2 Account is not Registered"
}

$Sourcescan = Get-AzPurviewScan -Endpoint $TakeEndpoint -DataSourceName $Adlssource
if($Sourcescan){
    Write-Host "ADLS Gen2 Scan is succeeded"
}
else{
    Write-Host "ADLS Gen2 Scan is not succeeded"
}
