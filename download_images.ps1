$images = @{
    "room1.jpg"   = "https://images.unsplash.com/photo-1629851608620-833446dfc8c1?auto=format&fit=crop&w=600&q=80"
    "room2.jpg"   = "https://images.unsplash.com/photo-1582139329536-e7284fece509?auto=format&fit=crop&w=600&q=80"
    "room3.jpg"   = "https://images.unsplash.com/photo-1509114397022-ed747cca3f65?auto=format&fit=crop&w=600&q=80"
    "about.jpg"   = "https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=800&q=80"
    "team1.jpg"   = "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80"
    "admin.jpg"   = "https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&w=32&q=80"
    "map.jpg"     = "https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&w=800&q=80"
    "blog1.jpg"   = "https://images.unsplash.com/photo-1455390582262-044cdead27d8?auto=format&fit=crop&w=600&q=80"
    "blog2.jpg"   = "https://images.unsplash.com/photo-1505664177922-c3846b0a1fae?auto=format&fit=crop&w=600&q=80"
    "blog3.jpg"   = "https://images.unsplash.com/photo-1432821596592-e2c18b78144f?auto=format&fit=crop&w=600&q=80"
}
foreach ($key in $images.Keys) {
    Invoke-WebRequest -Uri $images[$key] -OutFile "assets\images\$key"
    Write-Host "Downloaded $key"
}
