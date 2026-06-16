$sections = @"
        <!-- Section 3: How It Works -->
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-5">How Corporate Events Work</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="p-4 custom-card h-100 bg-transparent text-white border" style="border-color: rgba(255,255,255,0.1) !important;">
                            <i class="bi bi-1-circle-fill fs-1 text-primary mb-3"></i>
                            <h4>Consultation</h4>
                            <p class="text-muted">We assess your team size and goals to recommend the perfect rooms.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-4 custom-card h-100 bg-transparent text-white border" style="border-color: rgba(255,255,255,0.1) !important;">
                            <i class="bi bi-2-circle-fill fs-1 text-primary mb-3"></i>
                            <h4>The Escape</h4>
                            <p class="text-muted">Teams work together under pressure, testing communication and problem-solving.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-4 custom-card h-100 bg-transparent text-white border" style="border-color: rgba(255,255,255,0.1) !important;">
                            <i class="bi bi-3-circle-fill fs-1 text-primary mb-3"></i>
                            <h4>Debrief</h4>
                            <p class="text-muted">Analyze team performance over catered food and drinks in our lounge.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Section 4: Testimonials -->
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-5">Trusted by Industry Leaders</h2>
                <div class="row g-4 justify-content-center">
                    <div class="col-md-6">
                        <div class="p-4 custom-card bg-transparent border text-white" style="border-color: rgba(255,255,255,0.1) !important;">
                            <i class="bi bi-quote fs-1 text-secondary opacity-50"></i>
                            <p class="fs-5 mb-4">"The best team building event we've ever had. It really highlighted natural leaders within our departments."</p>
                            <h5 class="fw-bold text-primary mb-0">TechCorp Inc.</h5>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Section 5: Call to Action -->
        <section class="py-5 text-center" style="background-color: var(--tertiary-color); color: #fff;">
            <div class="container py-5">
                <h2 class="fw-bold mb-4">Ready to Challenge Your Team?</h2>
                <p class="lead mb-4">Contact our event coordinators to build a custom package.</p>
                <a href="contact.html" class="btn btn-primary-custom btn-lg">Book Corporate Event</a>
            </div>
        </section>
"@

$file = "home-2.html"
$content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
$content = $content -replace '(?s)(</main>)', "`r`n$sections`r`n`$1"
[System.IO.File]::WriteAllText($file, $content, [System.Text.Encoding]::UTF8)
Write-Host "Updated $file"
