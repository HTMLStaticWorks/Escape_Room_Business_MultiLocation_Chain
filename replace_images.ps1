$files = Get-ChildItem -Filter *.html

foreach ($file in $files) {
    $c = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)

    # 1. Replace empty bi-image divs in cards (like rooms and blogs)
    # We will replace them sequentially with room1, room2, room3
    $roomImages = @('assets/images/room1.jpg', 'assets/images/room2.jpg', 'assets/images/room3.jpg')
    $roomIdx = 0
    $regexCardImage = '<div style="background-color: var\(--tertiary-color\); height: 250px; border-radius: 10px;" class="d-flex align-items-center justify-content-center">\s*<i class="bi bi-image display-1 text-primary"></i>\s*</div>'
    
    while ($c -match $regexCardImage) {
        $img = $roomImages[$roomIdx % 3]
        $replacement = "<img src=`"$img`" class=`"img-fluid rounded`" alt=`"Featured Image`" style=`"height: 250px; width: 100%; object-fit: cover;`">"
        $c = $c -replace $regexCardImage, $replacement
        $roomIdx++
    }

    # 2. Replace empty bi-image div in about page (height: 400px)
    $regexAboutImage = '<div style="background-color: var\(--tertiary-color\); height: 400px; border-radius: 10px;" class="d-flex align-items-center justify-content-center">\s*<i class="bi bi-image display-1 text-primary"></i>\s*</div>'
    $c = $c -replace $regexAboutImage, '<img src="assets/images/about.jpg" class="img-fluid rounded" alt="Our Story" style="height: 400px; width: 100%; object-fit: cover;">'

    # 3. Replace via.placeholder.com links
    $c = $c -replace 'https://via.placeholder.com/150', 'assets/images/team1.jpg'
    $c = $c -replace 'https://via.placeholder.com/40', 'assets/images/team1.jpg'
    $c = $c -replace 'https://via.placeholder.com/32', 'assets/images/admin.jpg'

    # 4. Replace gallery bg-secondary
    $galleryIdx = 0
    $regexGallery = '<div class="bg-secondary" style="height: 250px; border-radius: 10px;"></div>'
    while ($c -match $regexGallery) {
        $img = $roomImages[$galleryIdx % 3]
        $replacement = "<img src=`"$img`" class=`"img-fluid rounded`" alt=`"Gallery Image`" style=`"height: 250px; width: 100%; object-fit: cover;`">"
        $c = $c -replace $regexGallery, $replacement
        $galleryIdx++
    }

    # 5. Replace contact map placeholder
    $regexMap = '(?s)<div class="bg-secondary rounded" style="height: 300px; width: 100%; display: flex; align-items: center; justify-content: center;">\s*<span>Map View</span>\s*</div>'
    $c = $c -replace $regexMap, '<img src="assets/images/map.jpg" class="img-fluid rounded w-100" alt="Map View" style="height: 300px; object-fit: cover;">'

    [System.IO.File]::WriteAllText($file.FullName, $c, [System.Text.Encoding]::UTF8)
}
Write-Host "Replaced all placeholders in HTML files."
