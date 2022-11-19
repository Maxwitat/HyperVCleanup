#Hyper-V VM CleanUp helper
#V1.0, Nov. 2022

$vhdxLocation = 'E:\MachineRoom'

$vhdxs = Get-VM -VMName * | Select-Object VMId | Get-VHD 
#Get files on disk. Filter alloes search for vhdx and avhdx
$vhdxsOnDisk = Get-ChildItem -Path $vhdxLocation -Filter *.*vhdx -Recurse -ErrorAction SilentlyContinue -Force

foreach ($vhdxod in $vhdxsOnDisk){
    
    $PathOnDisk = ([string]$vhdxod.Directory + '\' + $vhdxod.Name)
    $LastWriteTime = $vhdxod.LastWriteTime.ToString("yyyy-MM-dd")
    $Size = ([string] $vhdxod.Length/(1024*1024)) 

    $found = $false
    foreach($vhdx in $vhdxs){
        
        #Write-Host $vhdx.Path -BackgroundColor DarkBlue -ForegroundColor yellow

        if($vhdx.Path -eq $PathOnDisk)
        {
             #Write-Host $vhdxod.Directory -BackgroundColor DarkGreen -ForegroundColor White
             $found = $true
             break
        }
        else
        {
             #Write-Host $vhdxod.Directory -BackgroundColor DarkYellow -ForegroundColor White
             $found = $false
        }
    }
    if($found)
    {
        Write-Host ('Found: ' + $PathOnDisk + '   Last write time: ' + $LastWriteTime + '   SizeInMB: ' + $Size)  -BackgroundColor Green -ForegroundColor Black
    }
    else
    {
        Write-Host ("Not found: " +$PathOnDisk  + '   Last write time: ' + $LastWriteTime + '   SizeInMB: ' + $Size) -BackgroundColor Yellow -ForegroundColor Blue
    }
}