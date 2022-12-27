param(
    [ValidateSet("sand","dev","stage","prod")]
    [Parameter(Mandatory = $True)]
    [string]$EnvironmentType,

    [Parameter(Mandatory = $True)]
    [string]$EnvironmentName,

    [Parameter(Mandatory=$True)]
    [string]$ServiceName,

    [Parameter(Mandatory=$True)]
    [string]$ShortServiceName
)

$ErrorActionPreference = "Stop"
Import-Module $PSScriptRoot/common.psm1 -Force

$stackType = "sub"
Write-Host "Deploying $ShortServiceName-$stackType to $EnvironmentName environment."

dotnet lambda deploy-serverless `
    --package $PSScriptRoot/../deploy-package-sub.zip `
    --runtime linux-arm64 `
    --template $PSScriptRoot/../Clients.Infrastructure.Subscriber/application.yaml `
    --region eu-west-1 `
    --stack-name $ShortServiceName-$stackType-$EnvironmentName `
    --s3-bucket nth-deploy-sand `
    --s3-prefix $ServiceName-$EnvironmentName/$stackType/ `
    --capabilities CAPABILITY_NAMED_IAM `
    --template-parameters "EnvironmentType=$EnvironmentType;EnvironmentName=$EnvironmentName;ServiceName=$ServiceName;ShortServiceName=$ShortServiceName" `
    --tags "service-name=$ServiceName;environment=$EnvironmentType" `
    --no-fail-on-empty-changeset; StopOnNativeError