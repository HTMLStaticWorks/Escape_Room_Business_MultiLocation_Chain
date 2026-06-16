$indexContent = [System.IO.File]::ReadAllText((Resolve-Path "index.html").Path, [System.Text.Encoding]::UTF8)
$footerRegex = '(?s)<footer>.*?</footer>'
$footerMatch = [regex]::Match($indexContent, $footerRegex)

if ($footerMatch.Success) {
    $newFooter = $footerMatch.Value
    # Escape dollar signs in the replacement string so they aren't treated as regex backreferences
    $safeNewFooter = $newFooter.Replace('$', '$$')
    
    $htmlFiles = Get-ChildItem -Filter *.html | Where-Object { $_.Name -ne "index.html" }
    
    foreach ($file in $htmlFiles) {
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        if ($content -match $footerRegex) {
            $content = $content -replace $footerRegex, $safeNewFooter
            [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
            Write-Host "Updated footer in $($file.Name)"
        } else {
            $scriptRegex = '(?s)(<!-- Scripts -->|<!-- Back to top -->|<script src=")'
            if ($content -match $scriptRegex) {
                $content = $content -replace $scriptRegex, ($safeNewFooter + "`r`n`r`n`$1")
                [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
                Write-Host "Inserted footer in $($file.Name)"
            }
        }
    }
}
