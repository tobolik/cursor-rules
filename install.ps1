# Instalace firemních Cursor rules do projektu
# Použití: .\install.ps1 [cesta-k-projektu]
# Bez argumentu: zkopíruje do .cursor/rules/ v aktuální složce

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$rulesSource = Join-Path $scriptDir "rules"
$targetDir = $args[0]
if (-not $targetDir) { $targetDir = Get-Location }
$targetRules = Join-Path $targetDir ".cursor\rules"

if (-not (Test-Path $rulesSource)) {
    Write-Error "Slozka rules nenalezena: $rulesSource"
}
$null = New-Item -ItemType Directory -Path $targetRules -Force
Copy-Item -Path (Join-Path $rulesSource "*.mdc") -Destination $targetRules -Force
Write-Host "Pravidla zkopirovana do $targetRules"
