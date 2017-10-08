#=============================================================================================
# ____                        _                    _               
#|  _ \ _____      _____ _ __| |   _   _ _ __ ___ | |__   ___ _ __ 
#| |_) / _ \ \ /\ / / _ \ '__| |  | | | | '_ ` _ \| '_ \ / _ \ '__|
#|  __/ (_) \ V  V /  __/ |  | |__| |_| | | | | | | |_) |  __/ |   
#|_|   \___/ \_/\_/ \___|_|  |_____\__,_|_| |_| |_|_.__/ \___|_|   
#=============================================================================================
function Clear-LogDirectory {
	<#
	.SYNOPSIS
		Clears logs in a directory older than the specified number of days.
	.DESCRIPTION
		Clears logs in a directory older than the specified number of days.
	.PARAMETER Path
		Please Specify a valid path.
	.PARAMETER Daysback
		Please Specify a number of daysback.
	.EXAMPLE
		Clear-LogDirectory -Path "c:\temp" -DaysBack 3                    
	.NOTES
		No Additional information about the function or script.
	#>    
	param(    
		[cmdletbinding()]
		[Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_ })]
			[string]$Path,
        [Parameter(Mandatory=$true)]
			[int]$DaysBack
    )
    try {
        $DatetoDelete = (Get-Date).AddDays(-$Daysback)
        if(! (Get-ChildItem $Path)) {
            Write-Log -Message "Path is not valid" -OutputStyle consoleOnly
        } else {
            Get-ChildItem $Path -Recurse  | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Recurse -Confirm:$false
            Write-Log -Message "Logs older than $DaysBack have been cleared!" -OutputStyle consoleOnly
        }
    }
    Catch {
	    $ErrorMessage = $_.Exception.Message
    	$FailedItem = $_.Exception.ItemName		
		Write-Error "Error: $ErrorMessage $FailedItem"
		BREAK		
	}
}
#=============================================================================================
#  ___                 _                _         _                        _   _              
# |_ _|_ ____   _____ | | _____        / \  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __   
#  | || '_ \ \ / / _ \| |/ / _ \_____ / _ \| | | | __/ _ \| '_ ` _ \ / _` | __| |/ _ \| '_ \  
#  | || | | \ V / (_) |   <  __/_____/ ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | | 
# |___|_| |_|\_/ \___/|_|\_\___|    /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_| 
#=============================================================================================
