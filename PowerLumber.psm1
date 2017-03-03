#=============================================================================================
# ____                        _                    _               
#|  _ \ _____      _____ _ __| |   _   _ _ __ ___ | |__   ___ _ __ 
#| |_) / _ \ \ /\ / / _ \ '__| |  | | | | '_ ` _ \| '_ \ / _ \ '__|
#|  __/ (_) \ V  V /  __/ |  | |__| |_| | | | | | | |_) |  __/ |   
#|_|   \___/ \_/\_/ \___|_|  |_____\__,_|_| |_| |_|_.__/ \___|_|   
#=============================================================================================
function new-Log() {
	<#
	.SYNOPSIS
		Clears logs in a directory older than the specified number of days.
	.DESCRIPTION
		Clears logs in a directory older than the specified number of days.
	.PARAMETER Logfile
		Please Specify a valid path and file name.
	.EXAMPLE
		new-log -logfile c:\temp\new.log                    
	.NOTES
		No Additional information about the function or script.
	#>
	param(    
		[cmdletbinding()]
		[Parameter(Mandatory=$true)]
			[string]$Logfile
    ) 
    try {
        if( !(Split-Path -Path $Logfile -ErrorAction SilentlyContinue)) {
            write-Log -Message "Creating new Directory." -OutputStyle consoleOnly
            New-Item (Split-Path -Path $Logfile) -ItemType Directory -Force
        }
        write-Log -Message "Creating new file." -OutputStyle consoleOnly
        New-Item $logfile -type file -force -value "New file created."
    }
	Catch {
	    $ErrorMessage = $_.Exception.Message
    	$FailedItem = $_.Exception.ItemName		
		write-host "Error:" $ErrorMessage $FailedItem
		BREAK		
	}
}

#=============================================================================================
function Clear-Logs() {
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
		Clear-Logs -Path "c:\temp" -DaysBack 3                    
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
            write-Log -Message "Path is not valid" -OutputStyle consoleOnly
        } else {
            Get-ChildItem $Path -Recurse  | Where-Object { $_.LastWriteTime -lt $DatetoDelete } | Remove-Item -Recurse -Confirm:$false
            write-Log -Message "Logs older than $DaysBack have been cleared!" -OutputStyle consoleOnly
        }
    }
    Catch {
	    $ErrorMessage = $_.Exception.Message
    	$FailedItem = $_.Exception.ItemName		
		write-host "Error:" $ErrorMessage $FailedItem
		BREAK		
	}
}

#=============================================================================================
function Get-Timestamp() {
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
		write-host "Error:" $ErrorMessage $FailedItem
		BREAK		
	}
}

#=============================================================================================
function write-Log() {
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
		write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle noConsole
	.EXAMPLE
		write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle both
	.EXAMPLE
		write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle consoleOnly
	.EXAMPLE
		write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log"                        
	.EXAMPLE
		write-Log -Message "I love lamp" -OutputStyle consoleOnly                        
	.NOTES
		No Additional information about the function or script.
	#>
    [CmdletBinding(DefaultParameterSetName='LogFileFalse')]
	param(
		[Parameter(Mandatory=$true,Position=1,ParameterSetName='LogFileTrue')]
		[Parameter(Mandatory=$true,ParameterSetName='LogFileFalse')]
			[string]$Message,
		[Parameter(Mandatory=$true,ParameterSetName='LogFileTrue')]
			[string]$Logfile,
        [Parameter(Mandatory=$false,ParameterSetName='LogFileTrue')]
		[Parameter(Mandatory=$true,ParameterSetName='LogFileFalse')]
        [validateset('consoleOnly','Both','noConsole',IgnoreCase=$true)]
			[string]$OutputStyle
	)
    try {
	    $dateNow = Get-Timestamp
        switch ($OutputStyle)
        {
            consoleOnly {
                Write-Host ""
	    	    Write-Host "$dateNow $Message"
            }
            both {
                Write-Host ""
	    	    Write-Host "$dateNow $Message"
                if(!(Test-Path $logfile -ErrorAction SilentlyContinue)){
                    Write-Host "Logfile does not exist."
                    new-Log $Logfile
                }
                Write-Output "$dateNow $Message" | Out-File $Logfile -append -encoding ASCII                    
            }
            noConsole{
                Write-Output "$dateNow $Message" | Out-File $Logfile -append -encoding ASCII
            }
            default {
                Write-Host ""
	    	    Write-Host "$dateNow $Message"
                if(!(Test-Path $logfile -ErrorAction SilentlyContinue)){
                    Write-Host "Logfile does not exist."
                    new-Log $Logfile
                }            
                Write-Output "$dateNow $Message" | Out-File $Logfile -append -encoding ASCII
            }
        }
    }
	Catch {
	    $ErrorMessage = $_.Exception.Message
    	$FailedItem = $_.Exception.ItemName		
		write-host "Error:" $ErrorMessage $FailedItem
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
