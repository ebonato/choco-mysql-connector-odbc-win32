$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
#$url64 = 'https://cdn.mysql.com/archives/mysql-connector-odbc-8.0/mysql-connector-odbc-8.0.33-winx64.msi'
$url32 = 'https://cdn.mysql.com/archives/mysql-connector-odbc-8.0/mysql-connector-odbc-8.0.33-win32.msi'

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url = $url32

  softwareName = 'mysql odbc win32 driver *'

  checksum = '6999cb630a82876dda4e595e0e74ffbb'
  checksumType = 'md5'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

#if (-not ([System.Environment]::Is64BitOperatingSystem)) {
#  throw "This package requires a 64-bit version of Windows."
#}

Install-ChocolateyPackage @packageArgs
