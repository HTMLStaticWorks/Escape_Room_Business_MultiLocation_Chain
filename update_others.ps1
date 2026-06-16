# about.html (+1 section)
$aboutSections = @"
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-5">Meet the Puzzle Masters</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="p-4 custom-card h-100 bg-transparent text-white border" style="border-color: rgba(255,255,255,0.1) !important;">
                            <img src="https://via.placeholder.com/150" class="rounded-circle mb-3" alt="Team Member">
                            <h4 class="text-primary">Sarah Jenkins</h4>
                            <p class="text-muted">Lead Game Designer</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
"@
$content = [System.IO.File]::ReadAllText("about.html", [System.Text.Encoding]::UTF8)
$content = $content -replace '(?s)(</main>)', "`r`n$aboutSections`r`n`$1"
[System.IO.File]::WriteAllText("about.html", $content, [System.Text.Encoding]::UTF8)

# services.html (+1 section)
$servicesSections = @"
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-5">Why Choose Our Rooms</h2>
                <p class="lead">We focus on high-tech immersion over padlocks.</p>
            </div>
        </section>
"@
$content = [System.IO.File]::ReadAllText("services.html", [System.Text.Encoding]::UTF8)
$content = $content -replace '(?s)(</main>)', "`r`n$servicesSections`r`n`$1"
[System.IO.File]::WriteAllText("services.html", $content, [System.Text.Encoding]::UTF8)

# blog.html (+1 section)
$blogSections = @"
        <section class="py-5 text-center" style="background-color: var(--tertiary-color); color: #fff;">
            <div class="container py-5">
                <h2 class="fw-bold mb-4">Subscribe to Our Newsletter</h2>
                <p class="lead mb-4">Get the latest tips and news delivered to your inbox.</p>
                <form class="d-flex justify-content-center max-w-md mx-auto" style="max-width: 500px; margin: 0 auto;">
                    <input type="email" class="form-control me-2 py-3 bg-dark text-white" placeholder="Enter your email" required>
                    <button class="btn btn-primary-custom" type="submit">Subscribe</button>
                </form>
            </div>
        </section>
"@
$content = [System.IO.File]::ReadAllText("blog.html", [System.Text.Encoding]::UTF8)
$content = $content -replace '(?s)(</main>)', "`r`n$blogSections`r`n`$1"
[System.IO.File]::WriteAllText("blog.html", $content, [System.Text.Encoding]::UTF8)

# pricing.html (+2 sections)
$pricingSections = @"
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-4">Corporate & Team Building Packages</h2>
                <p class="lead mb-4">Special rates for groups of 12+ including catering options.</p>
                <a href="contact.html" class="btn btn-outline-primary">Contact Sales</a>
            </div>
        </section>
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-4">Frequently Asked Questions</h2>
                <p class="lead">Do I have to pay for the whole room if my group is small? No, pricing is per person.</p>
            </div>
        </section>
"@
$content = [System.IO.File]::ReadAllText("pricing.html", [System.Text.Encoding]::UTF8)
$content = $content -replace '(?s)(</main>)', "`r`n$pricingSections`r`n`$1"
[System.IO.File]::WriteAllText("pricing.html", $content, [System.Text.Encoding]::UTF8)

# contact.html (+2 sections)
$contactSections = @"
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-4">Our Locations</h2>
                <p class="lead">Find us in NY, LA, and Chicago.</p>
                <!-- Interactive map placeholder -->
                <div class="bg-secondary rounded" style="height: 300px; width: 100%; display: flex; align-items: center; justify-content: center;">
                    <span>Map View</span>
                </div>
            </div>
        </section>
        <section class="py-5 text-center" style="background-color: var(--tertiary-color); color: #fff;">
            <div class="container py-5">
                <h2 class="fw-bold mb-4">Follow Us on Social Media</h2>
                <div class="d-flex justify-content-center gap-4">
                    <a href="#" class="fs-1 text-white"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="fs-1 text-white"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="fs-1 text-white"><i class="bi bi-twitter"></i></a>
                </div>
            </div>
        </section>
"@
$content = [System.IO.File]::ReadAllText("contact.html", [System.Text.Encoding]::UTF8)
$content = $content -replace '(?s)(</main>)', "`r`n$contactSections`r`n`$1"
[System.IO.File]::WriteAllText("contact.html", $content, [System.Text.Encoding]::UTF8)

Write-Host "Other pages updated"
