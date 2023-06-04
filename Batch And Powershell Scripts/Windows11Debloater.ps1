# Credits to JustAnInternetGuy

# To run, right click > Run with powershell.

# Check if the script is running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

# If not running as administrator, relaunch the script as administrator
if (-not $isAdmin) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Add your preinstalled apps list here
$preinstalledApps = @(
    "Microsoft.Edge",
    "Microsoft.EdgeUpdate",
    "Microsoft.EdgeWebView2Runtime",
    "Microsoft.Cortana",
    "Microsoft.BingNews",
    "Microsoft.MSNWeather",
    "Microsoft.XboxApp",
    "Microsoft.GetHelp",
    "Microsoft.Tips",
    "Microsoft.MicrosoftEdge",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.Paint",
    "Microsoft.People",
    "Microsoft.PowerAutomateDesktop",
    "Microsoft.ToDo",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxGameBar.Plugin",
    "Microsoft.XboxGameBar",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxGameSpeechWindow",
    "Microsoft.YourPhone",
    "Microsoft.WindowsWebExperiencePack",
    "Microsoft.SkypeApp",
    "Microsoft.BingNews",
    "Microsoft.LinkedIn",
    "Microsoft.BingWeather",
    "Microsoft.GamingApp",
    "Microsoft.GetHelp",
    "Microsoft.GetStarted",
    "Microsoft.3DViewer",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.Office.OneNote",
    "Microsoft.WindowsCamera",
    "microsoft.windowscommunicationsapps",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo"
)

foreach ($app in $preinstalledApps) {
    Write-Host "Removing app: $app"
    Get-AppxPackage -Name $app | Remove-AppxPackage -Confirm:$false
}

Write-Host ""

$customMessage = "Bloatware removal completed. To exit, press any key."

Write-Host $customMessage
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

