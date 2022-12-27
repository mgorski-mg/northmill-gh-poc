function StopOnNativeError
{
    if ($lastexitcode -ne 0)
    {
        Write-Error "Native command failed with a non-zero error code" -ErrorAction Stop
    }
}

function GetEnvironmentName([string]$EnvironmentType, [string]$StackNameSuffix)
{
    if ($StackNameSuffix)
    {
        return "$EnvironmentType-$StackNameSuffix"
    }

    return $EnvironmentType
}