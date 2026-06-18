$oldHtml = @"
                <button onclick="document.dir = document.dir === 'rtl' ? 'ltr' : 'rtl';" class="btn btn-outline-secondary fw-bold w-100 py-2" style="color: var(--text-color);">RTL Toggle</button>
"@

$newHtml = @"
                <div class="d-flex gap-2 w-100">
                    <button onclick="document.dir = document.dir === 'rtl' ? 'ltr' : 'rtl';" class="btn btn-outline-secondary fw-bold w-50 py-2 flex-grow-1" style="color: var(--text-color);">RTL</button>
                    <button class="btn btn-outline-secondary fw-bold w-50 py-2 flex-grow-1 theme-toggle-btn" style="color: var(--text-color);"><i class="bi bi-sun"></i> Theme</button>
                </div>
"@

Get-ChildItem -Filter *.html -Recurse | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $content = $content.Replace($oldHtml, $newHtml)
    Set-Content -Path $_.FullName -Value $content -NoNewline
    Write-Host "Processed $($_.Name)"
}
