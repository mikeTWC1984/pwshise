
### Explore fonts here:
### https://www.nerdfonts.com/font-downloads

#  Review currently installed nerd fonts (both Windows/Linux)
# [System.Drawing.Text.InstalledFontCollection]::new().Families | where { $_.name -like '*NF*' -OR $_.name -like '*Nerd*' }


$isWindows = $false # if on Windows change this to $true 

$baseUrl = "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/"
$fontName = "BigBlueTerminal"

# -------------------------------------------------------
Invoke-WebRequest -Uri $( "$baseUrl" + $fontName + ".zip") -OutFile "$fontName.zip"
Expand-Archive -Path "$fontName.zip" -Force

if($isWindows) {

  $shell = (New-Object -ComObject Shell.Application).Namespace(0x14)
  $fonts = ls ".\$fontName\*Windows*tf"
  foreach($f in $fonts) { $shell.CopyHere($f.fullname) }

} Else {
   
   $fonts = gci "./$fontName" | Where-Object { $_.Name  -notlike '*Windows*'} 
   foreach($f in $fonts) {
     $nf = "$HOME/.fonts/" + $f.Name 
     New-Item -ItemType File -Path $nf -Force 
     Copy-Item $f.fullname -Destination $nf
   }
}

Remove-Item "$fontName.zip"
Remove-Item $fontName -Recurse -Force
