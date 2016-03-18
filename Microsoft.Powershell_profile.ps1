# CUstomise Window
$host.ui.RawUI.WindowTitle = "PowerShell v" + $PSVersionTable.PSVersion + " on " + $env:COMPUTERNAME + " as " + (whoami /upn)
# Customise Prompt
function prompt {
(Get-Date | Select-Object -ExpandProperty DateTime) + " " + (Get-Location) + "> "
}
# Customise colours
$host.ui.RawUI.BackgroundColor = 'Black'
$host.ui.RawUI.ForegroundColor = 'Yellow'
cls
# Clean-up old Transcripts
$transcriptHome = $env:HOMEDRIVE + $env:HOMEPATH + '\'
Get-Item ($transcriptHome + 'Transcript*') | Where-Object {$_.LastWriteTime -lt ((Get-Date).AddYears(-1))} | Remove-Item
# Create transcript
$now = (Get-Date | Select-Object -Property *)
$transcriptFilename = $transcriptHome + 'Transcript-' + $now.Year + $now.Month + $now.Day + $now.Hour + $now.Minute + $now.Second + '.txt'
Start-Transcript $transcriptFilename
