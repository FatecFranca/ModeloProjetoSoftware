#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"

param(
  [switch]$DryRun,
  [switch]$Help
)

if ($Help) {
  @"
Usage: speckit-init.ps1 [-DryRun] [-Help]
Prepara estrutura SPEC KIT: .specify/, specs/, .github/prompts/.
"@ | Write-Host
  exit 0
}

function New-DirSafe($path) {
  if ($DryRun) { Write-Host "DRY: mkdir $path" }
  else { New-Item -ItemType Directory -Force -Path $path | Out-Null }
}

$root = Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path))

New-DirSafe "$root/.specify/templates"
New-DirSafe "$root/.specify/scripts/bash"
New-DirSafe "$root/.specify/scripts/powershell"
New-DirSafe "$root/specs"
New-DirSafe "$root/.github/prompts"

$src = "$root/.specify/config.example.json"
$dst = "$root/.specify/config.json"
if (Test-Path $dst) {
  Write-Host "KEEP: $dst já existe"
} elseif (Test-Path $src) {
  if ($DryRun) { Write-Host "DRY: copy $src $dst" }
  else { Copy-Item $src $dst }
}

Write-Host "Init completo$([string]::Format('{0}', $(if($DryRun) ' (dry-run)' else '')))"
