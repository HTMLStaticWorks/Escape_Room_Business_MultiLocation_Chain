$indexContent = [System.IO.File]::ReadAllText((Resolve-Path "index.html").Path, [System.Text.Encoding]::UTF8)
$footerRegex = '(?s)<!-- Footer -->.*?<script src="assets/js/main.js"></script>'
$footerMatch = [regex]::Match($indexContent, $footerRegex)

if ($footerMatch.Success) {
    $fullFooterAndScripts = $footerMatch.Value
    $safeFooter = $fullFooterAndScripts.Replace('$', '$$')
    
    $htmlFiles = @("about.html", "services.html", "blog.html", "blog-details.html", "pricing.html", "contact.html", "login.html", "register.html")
    
    foreach ($file in $htmlFiles) {
        if (Test-Path $file) {
            $content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
            
            # If it already has the scripts at the bottom, just insert the footer.
            # But earlier grep showed they don't even have <script>. Let's just blindly insert before </body>
            # Just to be safe, clear out any existing footer or scripts if they somehow crept in
            $content = $content -replace '(?s)<footer>.*?</footer>', ''
            $content = $content -replace '(?s)<!-- Back to top -->.*?</div>', ''
            $content = $content -replace '(?s)<!-- Scripts -->.*?</script>', ''
            $content = $content -replace '(?s)<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>', ''
            $content = $content -replace '(?s)<script src="assets/js/main.js"></script>', ''
            
            $content = $content -replace '</body>', ($safeFooter + "`r`n</body>")
            
            [System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
            Write-Host "Fixed $file"
        }
    }
}
