echo "load profile"

# env path
$Env:Path += ';C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\'
$Env:Path += ';C:\SCOPE\ScopeSDK\'

# encoding
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
$env:LESSCHARSET = "utf-8"

# import module
Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Powerlevel10k-Lean
Set-PSReadLineOption -EditMode Emacs -BellStyle None

# alias
Set-Alias touch New-Item

## Linux command
# without pipeline
Remove-Item alias:cp
function cp() { coreutils.exe cp $args}
Remove-Item alias:mv
function mv() { coreutils.exe mv $args}
Remove-Item alias:rm
function rm() { coreutils.exe rm $args}
function mkdir() { coreutils.exe mkdir $args}
function printenv() { coreutils.exe printenv $args}

# with pipeline
Remove-Item alias:cat
function cat() { $input | coreutils.exe cat $args}
function head() { $input | coreutils.exe head $args}
function tail() { $input | coreutils.exe tail $args}
function wc() { $input | coreutils.exe wc $args}
function tr() { $input | coreutils.exe tr $args}
function pwd() { $input | coreutils.exe pwd $args}
function cut() { $input | coreutils.exe cut $args}
function uniq() { $input | coreutils.exe uniq $args}

# FIX: may lead problem because readonly alias
Remove-Item alias:sort -Force
function sort() { $input | coreutils.exe sort $args}

# Python
function ipython() { python3 -m IPython }

# functions
function pwdc() {Set-Clipboard "$pwd"}

function prompt {
  $isRoot = (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
  $color  = if ($isRoot) {"Red"} else {"Green"}
  $marker = if ($isRoot) {"#"}   else {"$"}

  Write-Host "$env:USERNAME " -ForegroundColor $color -NoNewline
  Write-Host "$pwd " -ForegroundColor Magenta -NoNewline
  Write-Host $marker -ForegroundColor $color -NoNewline
  return " "
}

function uptime() {
  [DateTime]::Now -  [Management.ManagementDateTimeConverter]::ToDateTime((Get-WmiObject Win32_OperatingSystem).LastBootUpTime) |
  Select-Object Days, Hours, Seconds, Milliseconds| Format-Table -AutoSize
}