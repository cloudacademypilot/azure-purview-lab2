$WorkSpace = Get-AzResource -ResourceGroupName az-purview-labs -Resourcetype Microsoft.Purview/accounts
$WorkSpacename = $WorkSpace.Name
$TakeEndpoint = 'https://'+$WorkSpacename+'.purview.azure.com'

$DataSource2 = Get-AzPurviewDataSource -Endpoint $TakeEndpoint -Name 'Adls-Gen2'
if($DataSource2){
    Write-Host "ADLS Gen2 Account is Registered"
}
else{
    Write-Host "ADLS Gen2 Account is not Registered"
}
$SourceAdlsscan = Get-AzPurviewScan -Endpoint $TakeEndpoint -DataSourceName 'Adls-Gen2' -Name 'Scan-adls'
if($SourceAdlsscan){
    Write-Host "ADLS Gen2 Scan is succeeded"
}
else{
    Write-Host "ADLS Gen2 Scan is not succeeded"
}
