#=============================================================================================
# ____                        _                    _
#|  _ \ _____      _____ _ __| |   _   _ _ __ ___ | |__   ___ _ __
#| |_) / _ \ \ /\ / / _ \ '__| |  | | | | '_ ` _ \| '_ \ / _ \ '__|
#|  __/ (_) \ V  V /  __/ |  | |__| |_| | | | | | | |_) |  __/ |
#|_|   \___/ \_/\_/ \___|_|  |_____\__,_|_| |_| |_|_.__/ \___|_|
#=============================================================================================
function Write-Log
{
    <#
	.SYNOPSIS
		Function to write log files, option to print to console.
	.DESCRIPTION
		Writes messages to log file and optional console.
	.PARAMETER Message
		Please Specify a message.
	.PARAMETER Logfile
		Please Specify a valid logfile.
	.PARAMETER OutputStyle
		Please specify an output OutputStyle.
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle noConsole
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle both
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle consoleOnly
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log"
	.EXAMPLE
		Write-Log -Message "I love lamp" -OutputStyle ConsoleOnly
	.NOTES
		No Additional information about the function or script.
	#>
    [CmdletBinding(DefaultParameterSetName = 'LogFileFalse')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileTrue')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileFalse')]
        [string]$Message,
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileTrue')]
        [string]$Logfile,
        [Parameter(Mandatory = $false, ParameterSetName = 'LogFileTrue')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileFalse')]
        [validateset('ConsoleOnly', 'Both', 'noConsole', IgnoreCase = $true)]
        [string]$OutputStyle
    )
    try
    {
        $dateNow = Get-Timestamp
        switch ($OutputStyle)
        {
            ConsoleOnly
            {
                Write-Output ""
                Write-Output "$dateNow $Message"
            }
            Both
            {
                Write-Output ""
                Write-Output "$dateNow $Message"
                if (!(Test-Path $logfile -ErrorAction SilentlyContinue))
                {
                    Write-Warning "Logfile does not exist."
                    New-Log -Logfile $Logfile
                }
                Write-Output "$dateNow $Message" | Out-File $Logfile -append -encoding ASCII
            }
            noConsole
            {
                if (!(Test-Path $logfile -ErrorAction SilentlyContinue))
                {
                    Write-Warning "Logfile does not exist."
                    New-Log -Logfile $Logfile
                }
                Write-Output "$dateNow $Message" | Out-File $Logfile -append -encoding ASCII
            }
            default
            {
                Write-Output ""
                Write-Output "$dateNow $Message"
                if (!(Test-Path $logfile -ErrorAction SilentlyContinue))
                {
                    Write-Warning "Logfile does not exist."
                    New-Log -Logfile $Logfile
                }            
                Write-Output "$dateNow $Message" | Out-File $Logfile -append -encoding ASCII
            }
        }
    }
    Catch
    {
        $ErrorMessage = $_.Exception.Message
        $FailedItem = $_.Exception.ItemName
        Throw "Write-Log: $ErrorMessage $FailedItem"
    }
}
#=============================================================================================
#  ___                 _                _         _                        _   _
# |_ _|_ ____   _____ | | _____        / \  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __
#  | || '_ \ \ / / _ \| |/ / _ \_____ / _ \| | | | __/ _ \| '_ ` _ \ / _` | __| |/ _ \| '_ \
#  | || | | \ V / (_) |   <  __/_____/ ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | |
# |___|_| |_|\_/ \___/|_|\_\___|    /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|
#=============================================================================================