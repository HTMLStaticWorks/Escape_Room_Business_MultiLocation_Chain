Get-ChildItem -Filter *.html -Recurse | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $newContent = $content -replace 'navbar-expand-lg', 'navbar-expand-xl' -replace 'd-none d-lg-flex', 'd-none d-xl-flex' -replace 'd-lg-none', 'd-xl-none'
    if ($content -cne $newContent) {
        Set-Content -Path $_.FullName -Value $newContent -NoNewline
        Write-Host "Updated $($_.Name)"
    }
}
