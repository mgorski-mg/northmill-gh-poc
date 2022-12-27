param(
    [ValidateSet("dev", "stage", "prod")]
    [Parameter(Mandatory = $True)]
    [string]$EnvironmentType,

    [Parameter(Mandatory = $False)]
    [string]$StackNameSuffix
)

$ErrorActionPreference = "Stop"
Import-Module $PSScriptRoot/common.psm1 -Force

$environmentName = GetEnvironmentName $EnvironmentType $StackNameSuffix
$serviceName = "clients"
$shortServiceName = "clients"

. $PSScriptRoot/deploy-config.ps1 $EnvironmentType $environmentName $serviceName $shortServiceName
. $PSScriptRoot/deploy-subscriber.ps1 $EnvironmentType $environmentName $serviceName $shortServiceName