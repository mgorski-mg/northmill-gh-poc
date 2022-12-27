param(
    [ValidateSet("dev", "stage", "prod")]
    [Parameter(Mandatory = $True)]
    [string]$EnvironmentType,

    [Parameter(Mandatory = $True)]
    [string]$EnvironmentName,

    [Parameter(Mandatory = $True)]
    [string]$ServiceName,

    [Parameter(Mandatory = $True)]
    [string]$ShortServiceName
)

$ErrorActionPreference = "Stop"
Import-Module $PSScriptRoot/common.psm1 -Force

$stackType = "config"
Write-Host "Deploying $ShortServiceName-$stackType to $EnvironmentName environment."

aws cloudformation deploy `
    --template-file $PSScriptRoot/../Environment/config.yaml `
    --stack-name $ShortServiceName-$stackType-$EnvironmentName `
    --s3-bucket nth-deploy-sand `
    --s3-prefix $ServiceName-$EnvironmentName/$stackType `
    --parameter-overrides "ServiceName=$ServiceName" `
    --capabilities CAPABILITY_NAMED_IAM `
    --tags "service-name=$ServiceName" "environment=$EnvironmentType" `
    --no-fail-on-empty-changeset ; StopOnNativeError