function Invoke-RollLog
{
    <#
	.DESCRIPTION
		This function will Roll the log file if it is a new week day.
    .PARAMETER LogFile
        A valid file path is required. 
    .PARAMETER Weekday
        A valid Weekday in datetime format is required. 
	.EXAMPLE
        Invoke-RollLogs -LogFile "c:\temp\test.log"
	.NOTES
        It's pretty simple.
    #>
    [CmdletBinding()]
    [OutputType([boolean])]
    param(
        [Parameter(Mandatory = $true)][String]$Logfile,
        [Parameter(Mandatory = $true)]$Weekday

    )
    try
    {
        if (!(Test-Path -Path $Logfile))
        {
            Throw "LogFile path: $Logfile does not exist."
            Write-log -Message "#################### New Log created #####################" -Logfile $logfile -OutputStyle both
        }
        else
        {
            # Determine if its a new day
            if (Compare-Weekday -Weekday $Script:Weekday)
            {
                # The Day of the week has not changed.
                Return $true
            }
            else
            {
                # The day of the week has changed.
                $CurrentTime = Get-Date -Format MMddHHmm
                $OldLogName = "$currentTime.log"
                Rename-Item -Path $logfile -NewName $OldLogName -Force -Confirm:$false
                # Create a new log.
                write-log -Message "#################### New Log created #####################" -Logfile $logfile
            }
        }
    }
    catch
    {
        $ErrorMessage = $_.Exception.Message
        $FailedItem = $_.Exception.ItemName		
        Write-Error "Error: $ErrorMessage $FailedItem"
        Throw $_
    }
}