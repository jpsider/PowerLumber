#=============================================================================================
# ____                        _                    _               
#|  _ \ _____      _____ _ __| |   _   _ _ __ ___ | |__   ___ _ __ 
#| |_) / _ \ \ /\ / / _ \ '__| |  | | | | '_ ` _ \| '_ \ / _ \ '__|
#|  __/ (_) \ V  V /  __/ |  | |__| |_| | | | | | | |_) |  __/ |   
#|_|   \___/ \_/\_/ \___|_|  |_____\__,_|_| |_| |_|_.__/ \___|_|   
#=============================================================================================
function Get-Timestamp {
	<#
	.SYNOPSIS
		Function to create timestamp.
	.DESCRIPTION
		Returns the current timestamp.
	.EXAMPLE
		$datenow = Get-Timestamp
	.NOTES
		No Additional information about the function or script.
	#>  
    try {
        return $(get-date).ToString("yyyy-MM-dd HH:mm:ss")
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
