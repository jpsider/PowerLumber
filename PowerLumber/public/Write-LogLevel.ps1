#=============================================================================================
# ____                        _                    _
#|  _ \ _____      _____ _ __| |   _   _ _ __ ___ | |__   ___ _ __
#| |_) / _ \ \ /\ / / _ \ '__| |  | | | | '_ ` _ \| '_ \ / _ \ '__|
#|  __/ (_) \ V  V /  __/ |  | |__| |_| | | | | | | |_) |  __/ |
#|_|   \___/ \_/\_/ \___|_|  |_____\__,_|_| |_| |_|_.__/ \___|_|
#=============================================================================================
function Write-LogLevel
{
    <#
	.SYNOPSIS
		Function to write information to  log files, based on a set LogLevel.
	.DESCRIPTION
        Writes messages to log file based on a set LogLevel.
        -RunLogLevel is the System Wide setting.
        -MsgLevel is specific to a message.
	.PARAMETER Message
		Please Specify a message.
	.PARAMETER Logfile
		Please Specify a valid logfile.
	.PARAMETER RunLogLevel
		Please specify a Running Log Level.
	.PARAMETER MsgLevel
		Please specify a Message Log Level.
	.EXAMPLE
		Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel All -MsgLevel TRACE
	.EXAMPLE
		Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel TRACE -MsgLevel TRACE
	.EXAMPLE
		Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel DEBUG -MsgLevel DEBUG
	.EXAMPLE
		Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel INFO -MsgLevel INFO
	.EXAMPLE
		Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel WARN -MsgLevel WARN
	.EXAMPLE
		Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel ERROR -MsgLevel ERROR        
	.EXAMPLE
		Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel FATAL -MsgLevel FATAL
	.EXAMPLE
		Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel CONSOLEONLY -MsgLevel CONSOLEONLY
	.EXAMPLE
		Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel OFF -MsgLevel OFF
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
        [string]$RunLogLevel,
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileTrue')]
        [Parameter(Mandatory = $true, ParameterSetName = 'LogFileFalse')]
        [ValidateSet("TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL", "CONSOLEONLY")]
        [string]$MsgLevel
    )
    try
    {
        switch ($RunLogLevel)
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
                Break
            }
            CONSOLEONLY
            {
                $OutPutStyle = "ConsoleOnly"
            }
            default
            {
                if (($RunLogLevel -eq "DEBUG") -and ($MsgLevel -ne "TRACE") -and ($MsgLevel -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                elseif (($RunLogLevel -eq "INFO") -and ($MsgLevel -ne "TRACE") -and ($MsgLevel -ne "DEBUG") -and ($MsgLevel -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                elseif (($RunLogLevel -eq "WARN") -and ($MsgLevel -ne "TRACE") -and ($MsgLevel -ne "DEBUG") -and ($MsgLevel -ne "INFO") -and ($MsgLevel -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                elseif (($RunLogLevel -eq "ERROR") -and ($MsgLevel -ne "TRACE") -and ($MsgLevel -ne "DEBUG") -and ($MsgLevel -ne "INFO") -and ($MsgLevel -ne "WARN") -and ($MsgLevel -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                elseif (($RunLogLevel -eq "FATAL") -and ($MsgLevel -ne "TRACE") -and ($MsgLevel -ne "DEBUG") -and ($MsgLevel -ne "INFO") -and ($MsgLevel -ne "WARN") -and ($MsgLevel -ne "ERROR") -and ($MsgLevel -ne "CONSOLEONLY"))
                {
                    $OutPutStyle = "Both"
                }
                else
                {
                    $OutPutStyle = "ConsoleOnly"
                }
            }
        }
        $Message = $MsgLevel + ": " + $Message
        if (($Logfile -eq "") -or ($null -eq $logfile))
        {
            Write-Log -Message $Message -OutputStyle $OutPutStyle
        }
        else
        {
            Write-Log -Message $Message -Logfile $Logfile -OutputStyle $OutPutStyle
        }
    }
    Catch
    {
        $ErrorMessage = $_.Exception.Message
        $FailedItem = $_.Exception.ItemName
        Throw "Write-LogLevel: $ErrorMessage $FailedItem"
    }
}
#=============================================================================================
#  ___                 _                _         _                        _   _
# |_ _|_ ____   _____ | | _____        / \  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __
#  | || '_ \ \ / / _ \| |/ / _ \_____ / _ \| | | | __/ _ \| '_ ` _ \ / _` | __| |/ _ \| '_ \
#  | || | | \ V / (_) |   <  __/_____/ ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | |
# |___|_| |_|\_/ \___/|_|\_\___|    /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|
#=============================================================================================