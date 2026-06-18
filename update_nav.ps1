$indexContent = [System.IO.File]::ReadAllText("index.html", [System.Text.Encoding]::UTF8)

# Find Header block in index.html
$startHeaderIndex = $indexContent.IndexOf("<!-- Header -->")
$mainTagIndex = $indexContent.IndexOf("<main>")

if ($startHeaderIndex -eq -1 -or $mainTagIndex -eq -1) {
    Write-Error "Could not find header or main tags in index.html"
    exit 1
}

$headerBlock = $indexContent.Substring($startHeaderIndex, $mainTagIndex - $startHeaderIndex)

$filesToUpdate = @(Get-ChildItem -Filter *.html | Where-Object { $_.Name -ne "index.html" -and $_.Name -ne "login.html" -and $_.Name -ne "register.html" }).Name

foreach ($file in $filesToUpdate) {
    if (Test-Path $file) {
        $content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
        
        $headerStart = $content.IndexOf("<!-- Header -->")
        if ($headerStart -eq -1) {
            $headerStart = $content.IndexOf("<header")
        }
        $mainStart = $content.IndexOf("<main>")
        
        if ($headerStart -ne -1 -and $mainStart -ne -1) {
            $newContent = $content.Substring(0, $headerStart) + $headerBlock + $content.Substring($mainStart)
            [System.IO.File]::WriteAllText($file, $newContent, [System.Text.Encoding]::UTF8)
            Write-Host "Updated header in $file"
        } else {
            # Check for body tag if header doesn't exist
            $bodyStart = $content.IndexOf("<body>")
            $bodyStyleStart = $content.IndexOf("<body ")
            $targetIndex = -1
            
            if ($bodyStyleStart -ne -1) {
                $targetIndex = $content.IndexOf(">", $bodyStyleStart) + 1
            } elseif ($bodyStart -ne -1) {
                $targetIndex = $bodyStart + 6
            }
            
            if ($targetIndex -ne -1) {
                $newContent = $content.Substring(0, $targetIndex) + "`r`n" + $headerBlock + "`r`n" + $content.Substring($targetIndex)
                [System.IO.File]::WriteAllText($file, $newContent, [System.Text.Encoding]::UTF8)
                Write-Host "Added header to $file"
            }
        }
    }
}
