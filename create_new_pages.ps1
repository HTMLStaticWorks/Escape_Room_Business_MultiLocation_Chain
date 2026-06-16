$template = [System.IO.File]::ReadAllText("about.html", [System.Text.Encoding]::UTF8)

# Extract header, scripts, footer from template
$headerRegex = '(?s)(<!DOCTYPE html>.*?</header>\s*<!-- Mobile Offcanvas Menu -->.*?(?:</div>\s*</div>))'
$footerRegex = '(?s)(<footer>.*)'

$headerMatch = [regex]::Match($template, $headerRegex)
$footerMatch = [regex]::Match($template, $footerRegex)

if ($headerMatch.Success -and $footerMatch.Success) {
    $header = $headerMatch.Value
    $footer = $footerMatch.Value

    # --- Create gallery.html ---
    $galleryHeader = $header -replace '<title>.*?</title>', '<title>Gallery - EscapeX</title>'
    $galleryMain = @"
    <main>
        <section class="page-hero" style="background-image: url('assets/images/services_hero.png');">
            <div class="container py-5">
                <h1 class="display-4 fw-bold">Our Gallery</h1>
                <p class="lead">A sneak peek into our immersive escape rooms.</p>
            </div>
        </section>
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-5">The Experience</h2>
                <div class="row g-4">
                    <div class="col-md-4"><div class="bg-secondary" style="height: 250px; border-radius: 10px;"></div></div>
                    <div class="col-md-4"><div class="bg-secondary" style="height: 250px; border-radius: 10px;"></div></div>
                    <div class="col-md-4"><div class="bg-secondary" style="height: 250px; border-radius: 10px;"></div></div>
                </div>
            </div>
        </section>
        <section class="py-5 text-center" style="background-color: var(--tertiary-color); color: #fff;">
            <div class="container py-5">
                <h2 class="fw-bold mb-4">See It For Yourself</h2>
                <a href="booking.html" class="btn btn-primary-custom btn-lg">Book Now</a>
            </div>
        </section>
    </main>
"@
    $galleryContent = "$galleryHeader`r`n$galleryMain`r`n$footer"
    [System.IO.File]::WriteAllText("gallery.html", $galleryContent, [System.Text.Encoding]::UTF8)
    Write-Host "Created gallery.html"

    # --- Create booking.html ---
    $bookingHeader = $header -replace '<title>.*?</title>', '<title>Book Now - EscapeX</title>'
    $bookingMain = @"
    <main>
        <section class="page-hero" style="background-image: url('assets/images/contact_hero.png');">
            <div class="container py-5">
                <h1 class="display-4 fw-bold">Book Your Escape</h1>
                <p class="lead">Select a location, room, and time slot to secure your adventure.</p>
            </div>
        </section>
        <section class="py-5 bg-dark text-white text-center">
            <div class="container py-5">
                <h2 class="fw-bold mb-5">Reservation System</h2>
                <div class="custom-card bg-transparent border p-5 text-start mx-auto" style="border-color: rgba(255,255,255,0.1) !important; max-width: 600px;">
                    <form>
                        <div class="mb-3">
                            <label class="form-label text-white">Location</label>
                            <select class="form-select bg-dark text-white"><option>New York, NY</option><option>Los Angeles, CA</option></select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-white">Room</label>
                            <select class="form-select bg-dark text-white"><option>The Heist</option><option>Asylum</option></select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-white">Date</label>
                            <input type="date" class="form-control bg-dark text-white">
                        </div>
                        <button class="btn btn-primary-custom w-100" type="button">Check Availability</button>
                    </form>
                </div>
            </div>
        </section>
        <section class="py-5 text-center" style="background-color: var(--tertiary-color); color: #fff;">
            <div class="container py-5">
                <h2 class="fw-bold mb-4">Booking Policies</h2>
                <p class="lead">All bookings are private. Please arrive 15 minutes before your scheduled start time.</p>
            </div>
        </section>
    </main>
"@
    $bookingContent = "$bookingHeader`r`n$bookingMain`r`n$footer"
    [System.IO.File]::WriteAllText("booking.html", $bookingContent, [System.Text.Encoding]::UTF8)
    Write-Host "Created booking.html"

} else {
    Write-Host "Failed to match header or footer"
}
