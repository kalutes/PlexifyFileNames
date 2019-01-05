param([string]$path = "",
		[string]$showName = "",
		[string]$seasonNumber = "",
		[string]$subtitleExt = "",
		[int32]$begin = 1
)

$files = Get-ChildItem -File $path | Sort-Object

for ($i = 0; $i -lt $files.Count; $i++) {
	$episode = $i + $begin
	$fullName = $files[$i].FullName
	$extension = $files[$i].Extension
	$destination = "$($path)\$($showName) - s$("{0:d2}" -f [int32]$seasonNumber)e$("{0:d2}" -f [int32]$episode)$($subtitleExt)$($extension)"
	Write-Output "Moving $($fullName) to $($destination)"
    Move-Item -LiteralPath "$fullName" -Destination "$destination"
}

exit
