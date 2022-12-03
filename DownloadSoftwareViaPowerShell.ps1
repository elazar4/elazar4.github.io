<#Basic
$Winrar = "RARLab.WinRAR"
$Zoom = "Zoom.Zoom"
$Everything = "voidtools.Everything"
$Chrome = "Google.Chrome"
$IDM = "Tonec.InternetDownloadManager"
$NotepadPP = "Notepad++.Notepad++"
$TeamViewer = "TeamViewer.TeamViewer"
$VLC = "VideoLAN.VLC"
$FormatFactory = "9N1KPX9M78D6"
$HpSmart = "9WZDNCRFHWLH"
$PDFXChangePRO = "TrackerSoftware.PDF-XChangePRO"
#Programing
$bluej = "BlueJTeam.BlueJ"
$Intellij = "JetBrains.IntelliJIDEA.CommunityA"
$VisualStudioCode = "Microsoft.VisualStudioCode"
$VisualStudioCommunity2022 = "Microsoft.VisualStudio.2022.Community"
$PyCharm = "JetBrains.PyCharm.Community"
#Browsers
$Brave = "XP8C9QZMS2PC1T"
$TorBrowser = "TorProject.TorBrowser"
#Internet
$ProtonVpn = "ProtonTechnologies.ProtonVPN"
#Virtual machines
$VirtualBox = "Oracle.VirtualBox"
$VMwareWorkstationPro = "VMware.WorkstationPro"
#More software
$Spotify = "Spotify.Spotify"
$Telegram = "Telegram.TelegramDesktop"
$GoogleDrive = "Google.Drive"
$Grammarly = "Grammarly.Grammarly"
$7zip = "7zip.7zip"
$IriunWebcam = "Iriun.IriunWebcam"
#>
$namesSoftware = @("Winrar", "Zoom", "Everything", "Chrome", "IDM", "Notepad++", "TeamViewer", "VLC", "Format Factory", "HP Smart",
"PDF XChange PRO", "Bluej", "Intellij", "Visual Studio Code", "Visual Studio Community 2022", "PyCharm", "Brave", "Tor Browser", "ProtonVpn",
"Virtual Box", "VM Ware Workstation Pro", "Spotify", "Telegram", "Google Drive", "Grammarly", "7zip", "Iriun Webcam")

$idSoftware = @("RARLab.WinRAR", "Zoom.Zoom", "voidtools.Everything", "Google.Chrome", "Tonec.InternetDownloadManager", "Notepad++.Notepad++",  
"TeamViewer.TeamViewer", "VideoLAN.VLC", "9N1KPX9M78D6", "9WZDNCRFHWLH", "TrackerSoftware.PDF-XChangePRO", "BlueJTeam.BlueJ",  
"JetBrains.IntelliJIDEA.CommunityA", "Microsoft.VisualStudioCode", "Microsoft.VisualStudio.2022.Community", "JetBrains.PyCharm.Community",  
"XP8C9QZMS2PC1T", "TorProject.TorBrowser", "ProtonTechnologies.ProtonVPN", "Oracle.VirtualBox", "VMware.WorkstationPro", "Spotify.Spotify",  
"Telegram.TelegramDesktop", "Google.Drive", "Grammarly.Grammarly", "7zip.7zip", "Iriun.IriunWebcam")   

$SoftwareToInstall = @()

$confirmation = Read-Host "If do you want to install all software press 1 `r`nIf do you want to install one by one press 2 `r`nIf do you want to select from list press 3"
switch ($confirmation) {
    1 {$confirmation = Read-Host "Do you want to install all the software or select one by one? (press y for yes)"
        if ($confirmation -eq 'y') {
        foreach ($i in $idSoftware){
            winget install $i --accept-package-agreements --accept-source-agreements
        }
    }}
    2 {Do{
        for($i = 0; $i -lt $idSoftware.Length; $i++){
            $confirmation = Read-Host "Do you want to install" ($namesSoftware[$i])"? (press y for yes)"
            if ($confirmation -eq 'y') {
                winget install $idSoftware[$i] --accept-package-agreements --accept-source-agreements
                $idSoftware = $idSoftware -ne $idSoftware[$i]
                $namesSoftware = $namesSoftware -ne $namesSoftware[$i]
            }
        }
        }while((Read-Host "Do you want to install") -eq 'y')}
    3 {for($i = 0; $i -lt $idSoftware.Length; $i++){
        $confirmation = Read-Host "Do you want to install" ($namesSoftware[$i])"? (press y for yes)"
        if ($confirmation -eq 'y') {
            $SoftwareToInstall += $i
        }
    }
    foreach($i in $SoftwareToInstall){
        winget install $idSoftware[$i] --accept-package-agreements --accept-source-agreements
    }}
    Default {Exit-PSHostProcess}
}
<#
$confirmation = Read-Host "Do you want to install all the software or select one by one? (press y for yes)"
if ($confirmation -eq 'y') {
    foreach ($i in $idSoftware){
        winget install $i --accept-package-agreements --accept-source-agreements
    }
}
else {
    for($i = 0; $i -lt $idSoftware.Length; $i++){
        $confirmation = Read-Host "Do you want to install" ($namesSoftware[$i])"? (press y for yes)"
        if ($confirmation -eq 'y') {
            $SoftwareToInstall += $i
        }
        else {
            $SoftwareToNoInstall += $i
        }
    }
    for($i = 0; $i -lt $SoftwareToInstall.Length; $i++){
        winget install $idSoftware[$i] --accept-package-agreements --accept-source-agreements
    }
}
else {
    Do{
    for($i = 0; $i -lt $idSoftware.Length; $i++){
        $confirmation = Read-Host "Do you want to install" ($namesSoftware[$i])"? (press y for yes)"
        if ($confirmation -eq 'y') {
            winget install $idSoftware[$i] --accept-package-agreements --accept-source-agreements
            $idSoftware = $idSoftware -ne $idSoftware[$i]
            $namesSoftware = $namesSoftware -ne $namesSoftware[$i]
        }
    }
    }while((Read-Host "Do you want to install") -eq 'y')
}

<#
Write-Host 'Hello, World!'
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -URI $URL -OutFile $Path
$ProgressPreference = 'Continue'
#>

