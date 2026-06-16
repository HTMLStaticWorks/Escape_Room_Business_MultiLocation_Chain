$files = @("404.html", "coming-soon.html", "dashboard.html")
foreach ($file in $files) {
    if (Test-Path $file) {
        $content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
        
        # Extract scripts to preserve them
        $scripts = ''
        if ($content -match '(?s)<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>') {
            $scripts += "<script src=`"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js`"></script>`r`n"
        }
        if ($content -match '(?s)<script src="assets/js/dashboard.js"></script>') {
            $scripts += "<script src=`"assets/js/dashboard.js`"></script>`r`n"
        } elseif ($content -match '(?s)<script src="assets/js/main.js"></script>') {
            $scripts += "<script src=`"assets/js/main.js`"></script>`r`n"
        }
        
        # Remove all existing footers and scripts
        $content = $content -replace '(?s)<footer>.*?</footer>', ''
        $content = $content -replace '(?s)<!-- Back to top -->.*?</div>', ''
        $content = $content -replace '(?s)<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>', ''
        $content = $content -replace '(?s)<script src="assets/js/main.js"></script>', ''
        $content = $content -replace '(?s)<script src="assets/js/dashboard.js"></script>', ''
        
        # Get index footer
        $indexContent = [System.IO.File]::ReadAllText("index.html", [System.Text.Encoding]::UTF8)
        $footerRegex = '(?s)<footer>.*?</footer>'
        $footerMatch = [regex]::Match($indexContent, $footerRegex)
        $safeFooter = $footerMatch.Value.Replace('$', '$$')
        
        # Trim any whitespace before </body>
        $content = $content -replace '(?s)\s+</body>', "`r`n</body>"
        
        # Insert one clean footer and scripts before </body>
        $content = $content -replace '</body>', ("`r`n" + $safeFooter + "`r`n" + $scripts + "</body>")
        [System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Cleaned $file"
    }
}
