# Get variables for directory path and report path

$DirectoryLocation = Read-Host -Prompt "Input the full path of the directory being enumerated without quotes"
$OutputFileLocation = Read-Host -Prompt "Input the full path where the txt file should be saved without quotes"

# Enumerate directory files and write to report

Get-ChildItem -Path $DirectoryLocation -Recurse -Force | Out-File -FilePath $OutputFileLocation

# Get count of files and sum of file sizes in bytes and append to report

Get-ChildItem -Path $DirectoryLocation | Measure-Object -Sum Length | Select-Object Count, Sum | Out-File -FilePath $OutputFileLocation -Append