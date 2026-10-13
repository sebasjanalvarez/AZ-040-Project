$files = @(Get-ChildItem -Path "E:\Mod07\LabFiles" -File)
foreach ($file in $files) {
    Write-Host $file.Name
}