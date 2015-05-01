$sourceFolder = $pwd

$files = Get-ChildItem -Recurse $sourceFolder | where {$_.PSIScontainer -eq $false}
foreach ($file in $files)
	{
		$destinationFolder = Split-Path -Parent $file.Directory.FullName
		$parentFolder = Split-Path -Parent $sourceFolder
		If($destinationFolder -ne $parentFolder)
		{move-item $file.FullName $destinationFolder}
	}

Get-ChildItem -recurse | Where {$_.PSIsContainer -and `
@(Get-ChildItem -Lit $_.Fullname -r | Where {!$_.PSIsContainer}).Length -eq 0} | Remove-Item -recurse
