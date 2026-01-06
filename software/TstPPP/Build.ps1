$env:TASMTABS = '..\tasm32'
$env:PATH = '..\tasm32;' + $env:PATH

$ErrorAction = 'Stop'

$TimeStamp = '"\"' + (Get-Date -Format 'yyMMddThhmm') + '\""'

Function dotasm($Architecture, $Component, $Output="${Component}.com")
{
  $Cmd = "tasm -t" + ${Architecture} + " -b -g3 -dTIMESTAMP=" + $TimeStamp + " -fFF ""${Component}.asm"" ${Output}"
  $Cmd | write-host
  Invoke-Expression $Cmd | write-host
  if ($LASTEXITCODE -gt 0) {throw "TASM returned exit code $LASTEXITCODE"}
}

dotasm 80 TstPPP