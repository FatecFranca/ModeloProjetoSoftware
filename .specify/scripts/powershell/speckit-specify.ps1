#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"

param(
  [Parameter(Mandatory=$true)][string]$Description,
  [switch]$DryRun,
  [switch]$Help
)

if ($Help) {
@"
Usage: speckit-specify.ps1 -Description "<texto>" [-DryRun]
Gera estrutura inicial de spec usando template.
"@ | Write-Host
  exit 0
}

$feature = $env:SPECIFY_FEATURE
if (-not $feature) { Write-Error "Defina SPECIFY_FEATURE (ex.: 1-nome)"; exit 1 }

$root = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path))
$target = Join-Path $root "specs/$feature"
$specFile = Join-Path $target "spec.md"
$template = Join-Path $root ".specify/templates/spec-template.md"

if ($DryRun) { Write-Host "DRY: mkdir $target" } else { New-Item -ItemType Directory -Force -Path $target | Out-Null }

if (-not (Test-Path $specFile)) {
  if ($DryRun) { Write-Host "DRY: copy $template $specFile" }
  else {
    Copy-Item $template $specFile
    (Get-Content $specFile) -replace '\[FEATURE NAME\]', $feature | Set-Content $specFile
  }
} else {
  Write-Host "KEEP: $specFile já existe"
}

Write-Host "Spec pronta em $specFile$([string]::Format('{0}', $(if($DryRun) ' (dry-run)' else '')))"
