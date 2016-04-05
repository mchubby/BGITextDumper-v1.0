param([string]$RootDir = '.')
$VerbosePreference='Continue'

Write-Host "Processing matching files in: $RootDir" -foregroundcolor cyan

$exe = $(Split-Path $MyInvocation.MyCommand.Path) + "\BGITextDumperBinaryOrder.exe"

Get-ChildItem -Path $RootDir\* -Include mainscript,Scenario[0-9]* -Exclude *.txt| % {
  Write-Verbose $_.name
  & $exe $_.Fullname
}
