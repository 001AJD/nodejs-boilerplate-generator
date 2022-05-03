$Source_Dir = '.\source\'
$Staging_Dir = '.\staging\'

# creates new files in source directory
Write-Host "Creating new files in source directory..."
for($i = 1 ; $i -le 10)
{
	$fileName = 'Coverages_Delta_20220228_' + $i + '.txt'
	#New-Item $Source_Dir\$fileName -ItemType File
	$i++
}

#get list of all the files in source folder
Write-Host 'Retrieving list of all files from source folder...'
$Files_List =  Get-ChildItem $Source_Dir
#Write-Host $Files_List;

#check if staging folder is empty or not
$DirectoryInfo = Get-ChildItem $Staging_Dir | Measure-Object 

#move files from source folder to staging folder
$BatchNumber = '20220228'
Write-Host $BatchNumber;

# move files from source to staging directory
md $Staging_Dir\$BatchNumber #create new folder in staging folder with batch number
Move-Item -Path $Source_Dir\*.txt -Destination $Staging_Dir\$BatchNumber
