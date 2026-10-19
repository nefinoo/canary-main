# Frozen Hell - augments Knight (niveles 100 a 200)
# PREVISUALIZAR: powershell -ExecutionPolicy Bypass -File .\balance_report\apply_knight_augments.ps1
# APLICAR:       powershell -ExecutionPolicy Bypass -File .\balance_report\apply_knight_augments.ps1 -Apply
# No cambia GitHub automaticamente.
param([switch]$Apply)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
$xmlPath = Join-Path $root "data\items\items.xml"
if (-not (Test-Path -LiteralPath $xmlPath)) {
    throw "No se encontro items.xml: $xmlPath"
}

$enc = [System.Text.Encoding]::GetEncoding("iso-8859-1")
$content = [System.IO.File]::ReadAllText($xmlPath, $enc)
$original = $content
$tag = "<!-- FROZEN_HELL_KNIGHT_AUGMENTS_V1 -->"
$items = @(
    @{
        Id = 3370; Name = "knight armor"
        Augments = @(
            @{ Spell = "berserk"; Type = "increased damage"; Value = 5 }
        )
    },
    @{
        Id = 3371; Name = "knight legs"
        Augments = @(
            @{ Spell = "fierce berserk"; Type = "increased damage"; Value = 4 }
        )
    },
    @{
        Id = 3392; Name = "royal helmet"
        Augments = @(
            @{ Spell = "berserk"; Type = "cooldown"; Value = 500 }
        )
    },
    @{
        Id = 3416; Name = "dragon shield"
        Augments = @(
            @{ Spell = "fierce berserk"; Type = "increased damage"; Value = 5 }
        )
    },
    @{
        Id = 3386; Name = "dragon scale mail"
        Augments = @(
            @{ Spell = "berserk"; Type = "increased damage"; Value = 5 },
            @{ Spell = "fierce berserk"; Type = "increased damage"; Value = 5 }
        )
    },
    @{
        Id = 3360; Name = "golden armor"
        Augments = @(
            @{ Spell = "fierce berserk"; Type = "increased damage"; Value = 8 },
            @{ Spell = "fierce berserk"; Type = "critical extra damage"; Value = 5 },
            @{ Spell = "fierce berserk"; Type = "mana leech"; Value = 3 }
        )
    }
)

$edited = 0
foreach ($entry in $items) {
    $pattern = '<item\s+id="' + $entry.Id + '"(?=\s|>)[\s\S]*?</item>'
    $matches = [regex]::Matches($content, $pattern)
    if ($matches.Count -ne 1) {
        throw "Se esperaba exactamente un item ID $($entry.Id). Encontrados: $($matches.Count)."
    }

    $match = $matches[0]
    $block = $match.Value
    if ($block -notmatch ('name="' + [regex]::Escape($entry.Name) + '"')) {
        throw "El ID $($entry.Id) no coincide con el nombre esperado: $($entry.Name)."
    }
    if ($block.Contains($tag)) {
        Write-Host "[OK] $($entry.Name) ya tiene los augments Frozen Hell."
        continue
    }
    if ($block.Contains('key="augments"')) {
        throw "El item $($entry.Name) ya tiene augments diferentes. Revisar manualmente."
    }

    $marker = [regex]::Match($block, '(?m)^([ \t]*)<attribute key="script"')
    if (-not $marker.Success) {
        throw "No se encontro el bloque script del item $($entry.Name)."
    }

    $indent = $marker.Groups[1].Value
    $indent1 = $indent + [char]9
    $indent2 = $indent1 + [char]9
    $lines = New-Object 'System.Collections.Generic.List[string]'
    $lines.Add($indent + $tag)
    $lines.Add($indent + '<attribute key="augments" value="1">')
    foreach ($augment in $entry.Augments) {
        $lines.Add($indent1 + '<attribute key="' + $augment.Spell + '" value="' + $augment.Type + '">')
        $lines.Add($indent2 + '<attribute key="value" value="' + $augment.Value + '"/>')
        $lines.Add($indent1 + '</attribute>')
    }
    $lines.Add($indent + '</attribute>')
    $replacement = ($lines -join [string][char]10) + [char]10 + $marker.Value
    $newBlock = $block.Substring(0, $marker.Index) + $replacement + $block.Substring($marker.Index + $marker.Length)
    $content = $content.Substring(0, $match.Index) + $newBlock + $content.Substring($match.Index + $match.Length)
    $edited++
    Write-Host "[PREPARADO] $($entry.Name) ID $($entry.Id): $($entry.Augments.Count) augment(s)."
}

if (-not $Apply) {
    Write-Host "Previsualizacion terminada. Ningun archivo modificado."
    Write-Host "Para aplicar: powershell -ExecutionPolicy Bypass -File .\balance_report\apply_knight_augments.ps1 -Apply"
    exit 0
}

if ($edited -eq 0) {
    Write-Host "No hay cambios nuevos."
    exit 0
}
if (-not $original.StartsWith('<?xml version="1.0" encoding="ISO-8859-1"?>')) {
    throw "La codificacion de items.xml es inesperada. No se modifico nada."
}

$backup = $xmlPath + ".frozen-hell-backup.xml"
if (-not (Test-Path -LiteralPath $backup)) {
    [System.IO.File]::Copy($xmlPath, $backup)
}
[System.IO.File]::WriteAllText($xmlPath, $content, $enc)
Write-Host "Augments aplicados a $edited items. Backup: $backup"
Write-Host "Revisa el diff en GitHub Desktop y prueba en Canary antes de hacer merge."
