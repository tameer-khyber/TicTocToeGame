$baseUrl = "https://raw.githubusercontent.com/Kronus-Not-Kratos/Game-Sound-Effects/master"
$assets = @{
    "UI/Button%20Click%207.wav" = "assets/audio/move.wav"
    "Fanfares/Fanfare%202.wav" = "assets/audio/win.wav"
    "UI/Error%202.wav" = "assets/audio/draw.wav"
}

foreach ($key in $assets.Keys) {
    $url = "$baseUrl/$key"
    $output = $assets[$key]
    Write-Host "Downloading $url to $output..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $output
        Write-Host "Success!"
    } catch {
        Write-Host "Failed to download $url"
        Write-Host $_
    }
}
