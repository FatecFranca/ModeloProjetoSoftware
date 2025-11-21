#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"

function Run-Help($path, $args = @("--help")) {
  if (Test-Path $path) {
    Write-Host "==> $path $($args -join ' ')"
    & $path @args *> $null
  } else {
    Write-Host "SKIP: $path not found"
  }
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Run-Help "$scriptDir/speckit-init.ps1"
Run-Help "$scriptDir/speckit-specify.ps1"
Run-Help "$scriptDir/speckit-plan.ps1"
Run-Help "$scriptDir/speckit.tasks.ps1"
Run-Help "$scriptDir/speckit-checklist.ps1"
Run-Help "$scriptDir/speckit-implement.ps1"
Run-Help "$scriptDir/validate-spec-kit.ps1"
