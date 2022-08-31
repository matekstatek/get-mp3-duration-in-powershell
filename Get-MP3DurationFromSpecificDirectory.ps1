[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$Path = "."
)

if ($Path -eq "."){
    write-host "Looking for mp3 files in . ($(pwd | 
                                                  select -ExpandProperty path))"
}

else{
    write-host "Looking for mp3 files in $Path"
}

$seconds = 0
$minutes = 0
$hours = 0

$files = Get-ChildItem "$($path)*.mp3"

if ($files.Length -eq 0){
    Write-Host "No mp3 found." -ForegroundColor Red
    return
}

$allmp3s = @()
foreach ($f in $files){
    $shell = New-Object -COMObject Shell.Application
    $folder = Split-Path $f.fullname
    $file = Split-Path $f.fullname -Leaf
    $shellfolder = $shell.Namespace($folder)
    $shellfile = $shellfolder.ParseName($file)

    $time = $shellfolder.GetDetailsOf($shellfile, 27);

    $allmp3s += New-Object psobject -Property @{
        Name = $f.name
        Duration = $time
    }

    $seconds += [int]$time.Split(":")[2]
    $minutes += [int]$time.Split(":")[1]
    $hours += [int]$time.split(":")[0]
}

Write-Host "All mp3s:" -ForegroundColor Green
$allmp3s | 
    Format-Table -AutoSize Name, Duration

$addMinutes = 0
while($seconds -ge 60){
    $addMinutes ++
    $seconds -= 60
}

$minutes += $addMinutes
$addHours = 0

while($minutes -ge 60){
    $addHours ++
    $minutes -= 60
}

$hours += $addHours

Write-Host "Duration of all mp3 in directory: $('{0:d2}' -f [int]$hours):$('{0:d2}' -f [int]$minutes):$('{0:d2}' -f [int]$seconds)" -ForegroundColor Green