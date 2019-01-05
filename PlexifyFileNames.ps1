param([string]$path = "",
		[string]$showName = "",
		[string]$seasonNumber = ""
)

$files = Get-ChildItem $path | Sort-Object

for ($i = 0; $i -lt $files.Count; $i++) {
	$episode = $i + 1
	$fullName = $files[$i].FullName
	$extension = $files[$i].Extension
	$destination = "$($path)\$($showName) - s$("{0:d2}" -f [int32]$seasonNumber)e$("{0:d2}" -f [int32]$episode)$($extension)"
	Write-Output "Moving $($fullName) to $($destination)"
    Move-Item -LiteralPath "$fullName" -Destination "$destination"
}

exit
