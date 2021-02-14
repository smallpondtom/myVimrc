$url = 'https://github.com/haasosaurus/nerd-fonts/raw/regen-mono-font-fix/patched-fonts/LiberationMono/complete/Literation%20Mono%20Nerd%20Font%20Complete%20Mono%20Windows%20Compatible.ttf'
$name = "LiberationMono NF"
$file = "$($env:TEMP)\$($name).ttf"
Start-BitsTransfer -Source $url -Destination $file   # Download the font

$Install = $true  # $false to uninstall (or 1 / 0)
$FontsFolder = (New-Object -ComObject Shell.Application).Namespace(0x14)   # Must use Namespace part or will not install properly
$filename = (Get-ChildItem $file).Name
$filepath = (Get-ChildItem $file).FullName
$target = "C:\Windows\Fonts\$($filename)"

If (Test-Path $target -PathType Any) { Remove-Item $target -Recurse -Force } # UnInstall Font

If ((-not(Test-Path $target -PathType Container)) -and ($Install -eq $true)) { $FontsFolder.CopyHere($filepath, 16) }   # Following action performs the install, requires user to click on yes

$key = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont'   # Need to set this for console
Set-ItemProperty -Path $key -Name '000' -Value $name

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force   # Always need this, required for all Modules
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted   # Set Microsoft PowerShell Gallery to 'Trusted'
Install-Module Terminal-Icons -Scope CurrentUser
Import-Module Terminal-Icons
Install-Module WindowsConsoleFonts
Set-ConsoleFont $name
