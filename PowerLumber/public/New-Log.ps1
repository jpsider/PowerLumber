#=============================================================================================
# ____                        _                    _
#|  _ \ _____      _____ _ __| |   _   _ _ __ ___ | |__   ___ _ __
#| |_) / _ \ \ /\ / / _ \ '__| |  | | | | '_ ` _ \| '_ \ / _ \ '__|
#|  __/ (_) \ V  V /  __/ |  | |__| |_| | | | | | | |_) |  __/ |
#|_|   \___/ \_/\_/ \___|_|  |_____\__,_|_| |_| |_|_.__/ \___|_|
#=============================================================================================
function New-Log
{
    <#
	.SYNOPSIS
		Clears logs in a directory older than the specified number of days.
	.DESCRIPTION
		Clears logs in a directory older than the specified number of days.
	.PARAMETER Logfile
		Please Specify a valid path and file name.
	.EXAMPLE
		New-Log -Logfile c:\temp\new.log
	.NOTES
		No Additional information about the function or script.
	#>
    [CmdletBinding(
        SupportsShouldProcess = $true
    )]
    param(    
        [Parameter(Mandatory = $true)]
        [string]$Logfile
    )
    try
    {
        if ( !(Split-Path -Path $Logfile -ErrorAction SilentlyContinue))
        {
            write-Log -Message "Creating new Directory." -OutputStyle consoleOnly
            if ($PSCmdlet.ShouldProcess("Creating new Directory")) {New-Item (Split-Path -Path $Logfile) -ItemType Directory -Force}
        }
        write-Log -Message "Creating new file." -OutputStyle consoleOnly
        if ($PSCmdlet.ShouldProcess("Creating new File")) {New-Item $logfile -type file -force -value "New file created."}
    }
    Catch
    {
        $ErrorMessage = $_.Exception.Message
        $FailedItem = $_.Exception.ItemName
        Throw "New-Log: $ErrorMessage $FailedItem"
    }
}
#=============================================================================================
#  ___                 _                _         _                        _   _
# |_ _|_ ____   _____ | | _____        / \  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __
#  | || '_ \ \ / / _ \| |/ / _ \_____ / _ \| | | | __/ _ \| '_ ` _ \ / _` | __| |/ _ \| '_ \
#  | || | | \ V / (_) |   <  __/_____/ ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | |
# |___|_| |_|\_/ \___/|_|\_\___|    /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|
#=============================================================================================