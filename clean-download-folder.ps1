# resources :
#   delete files/directories older than X days  https://stackoverflow.com/questions/17829785/delete-files-older-than-15-days-using-powershell
#   execute scheduled tasks                     https://community.spiceworks.com/how_to/17736-run-powershell-scripts-from-task-scheduler

$limit = (Get-Date).AddDays(-6)
$path = "C:\Users\GraouFamily\Downloads"

# Delete files older than the $limit.
Get-ChildItem -Path $path -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item

# Delete any empty directories left behind after deleting the old files.
# Get-ChildItem -Path $path -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse
