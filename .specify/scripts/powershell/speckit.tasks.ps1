#!/usr/bin/env pwsh
$ErrorActionPreference='Stop'
param([switch]$Help)
if($Help){
@"Usage: speckit.tasks.ps1 [-Help]
Stub placeholder; to be implemented.@"|Write-Host
exit 0
}
Write-Host 'speckit.tasks.ps1 (stub)'
