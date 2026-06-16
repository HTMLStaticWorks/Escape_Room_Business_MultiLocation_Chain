# login.html
$content = [System.IO.File]::ReadAllText("login.html", [System.Text.Encoding]::UTF8)
$content = $content -replace '(<main.*?)(<div class="container py-5">)', '$1<section class="py-5">$2'
$content = $content -replace '(</main>)', '</section>`r`n$1'
[System.IO.File]::WriteAllText("login.html", $content, [System.Text.Encoding]::UTF8)

# register.html
$content = [System.IO.File]::ReadAllText("register.html", [System.Text.Encoding]::UTF8)
$content = $content -replace '(<main.*?)(<div class="container py-5">)', '$1<section class="py-5">$2'
$content = $content -replace '(</main>)', '</section>`r`n$1'
[System.IO.File]::WriteAllText("register.html", $content, [System.Text.Encoding]::UTF8)

# blog-details.html
$relatedPosts = @"
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-4">Related Articles</h2>
                <div class="row g-4 justify-content-center">
                    <div class="col-md-4">
                        <div class="custom-card bg-transparent border p-4 text-white" style="border-color: rgba(255,255,255,0.1) !important;">
                            <h5>How to Beat The Clock</h5>
                            <a href="#" class="text-primary text-decoration-none">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
"@
$content = [System.IO.File]::ReadAllText("blog-details.html", [System.Text.Encoding]::UTF8)
$content = $content -replace '(?s)(<main class="py-5">)(.*?)(</main>)', "`$1`r`n<section>`$2</section>`r`n$relatedPosts`r`n`$3"
[System.IO.File]::WriteAllText("blog-details.html", $content, [System.Text.Encoding]::UTF8)

# dashboard.html
$dashSections = @"
                <section class="mb-5">
                    <h3 class="mb-3">Recent Bookings</h3>
                    <div class="table-responsive">
                        <table class="table table-dark table-hover">
                            <thead><tr><th>ID</th><th>User</th><th>Room</th><th>Status</th></tr></thead>
                            <tbody><tr><td>#1234</td><td>John Doe</td><td>The Heist</td><td><span class="badge bg-success">Confirmed</span></td></tr></tbody>
                        </table>
                    </div>
                </section>
                <section>
                    <h3 class="mb-3">Quick Actions</h3>
                    <div class="d-flex gap-3">
                        <button class="btn btn-primary-custom">Add Room</button>
                        <button class="btn btn-outline-secondary text-white">View Reports</button>
                    </div>
                </section>
"@
$content = [System.IO.File]::ReadAllText("dashboard.html", [System.Text.Encoding]::UTF8)
$content = $content -replace '(?s)(<div class="container-fluid p-4">)(.*?)(</div>\s*</div>\s*<footer>)', "`$1`r`n<section>`$2</section>`r`n$dashSections`r`n`$3"
[System.IO.File]::WriteAllText("dashboard.html", $content, [System.Text.Encoding]::UTF8)

Write-Host "Remaining pages updated"
