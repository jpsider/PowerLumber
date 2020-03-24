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
		Function to write information to  log files, based on a set LogLevel.
	.DESCRIPTION
        Writes messages to log file based on a set LogLevel.
        -LogLevel is the System Wide setting.
        -MsgType is specific to a message.
	.PARAMETER Message
		Please Specify a message.
	.PARAMETER Logfile
		Please Specify a valid logfile.
	.PARAMETER LogLevel
		Please specify a Running Log Level.
	.PARAMETER MsgType
		Please specify a Message Log Level.
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -LogLevel All -MsgType TRACE
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -LogLevel TRACE -MsgType TRACE
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -LogLevel DEBUG -MsgType DEBUG
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -LogLevel INFO -MsgType INFO
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -LogLevel WARN -MsgType WARN
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -LogLevel ERROR -MsgType ERROR
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -LogLevel FATAL -MsgType FATAL
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -LogLevel CONSOLEONLY -MsgType CONSOLEONLY
	.EXAMPLE
		Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -LogLevel OFF -MsgType OFF
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
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileTrue')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileFalse')]
        [ValidateSet("ALL", "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL", "CONSOLEONLY", "OFF")]
        [string]$LogLevel,
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileTrue')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileFalse')]
        [ValidateSet("TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL", "CONSOLEONLY")]
        [string]$MsgType
    )
    try
    {
        switch ($LogLevel)
        {
            ALL
            {
                $OutPutStyle = "Both"
            }
            TRACE
            {
                $OutPutStyle = "Both"
            }
            OFF
            {
                $OutPutStyle = "None"
            }
            CONSOLEONLY
            {
                $OutPutStyle = "ConsoleOnly"
            }
            default
            {
                if (($LogLevel -eq "DEBUG") -and ($MsgType -ne "TRACE") -and ($MsgType -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                elseif (($LogLevel -eq "INFO") -and ($MsgType -ne "TRACE") -and ($MsgType -ne "DEBUG") -and ($MsgType -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                elseif (($LogLevel -eq "WARN") -and ($MsgType -ne "TRACE") -and ($MsgType -ne "DEBUG") -and ($MsgType -ne "INFO") -and ($MsgType -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                elseif (($LogLevel -eq "ERROR") -and ($MsgType -ne "TRACE") -and ($MsgType -ne "DEBUG") -and ($MsgType -ne "INFO") -and ($MsgType -ne "WARN") -and ($MsgType -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                elseif (($LogLevel -eq "FATAL") -and ($MsgType -ne "TRACE") -and ($MsgType -ne "DEBUG") -and ($MsgType -ne "INFO") -and ($MsgType -ne "WARN") -and ($MsgType -ne "ERROR") -and ($MsgType -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                else
                {
                    $OutPutStyle = "ConsoleOnly"
                }
            }
        }
        $Message = $MsgType + ": " + $Message
        if (($Logfile -eq "") -or ($null -eq $logfile))
        {
            Write-Message -Message $Message -OutputStyle $OutPutStyle
        }
        else
        {
            Write-Message -Message $Message -Logfile $Logfile -OutputStyle $OutPutStyle
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