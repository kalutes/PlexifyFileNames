param([string]$path = "",
		[string]$showName = "",
		[string]$seasonNumber = ""
)

$files = Get-ChildItem $path | Sort-Object

for ($i = 0; $i -lt $files.Count; $i++) {
	$episode = $i + 1
	$fullName = $files[$i].FullName
	$extension = $files[$i].Extension
    Move-Item -Path $fullName -Destination "$($path)\$($showName) - s$("{0:d2}" -f [int32]$seasonNumber)e$("{0:d2}" -f [int32]$episode)$($extension)"
}

exit
