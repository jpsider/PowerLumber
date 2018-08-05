$script:ModuleName = 'PowerLumber'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"


Describe "Write-LogLevel function for $moduleName" {
    function Write-Log
    {
        param(
            [string]$OutputStyle
        )
        return $OutPutStyle
    }
    #ALL
    It "Should be 'both' when RunLogLevel is set to 'All'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "All" -MsgLevel "DEBUG" | Should be both
    }
    #TRACE
    It "Should be 'both' when RunLogLevel is set to 'TRACE'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "TRACE" -MsgLevel "DEBUG" | Should be both
    }
    #CONSOLEONLY
    It "Should be 'consoleOnly' when RunLogLevel is set to 'CONSOLEONLY'." {
        Write-LogLevel -Message "Test" -RunLogLevel "CONSOLEONLY" -MsgLevel "DEBUG" | Should be consoleOnly
    }
    #DEBUG
    It "Should be 'consoleOnly' when RunLogLevel is set to 'DEBUG' and MsgLevel is 'TRACE'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "DEBUG" -MsgLevel "TRACE" | Should be consoleOnly
    }
    It "Should be 'both' when RunLogLevel is set to 'DEBUG' and MsgLevel is 'DEBUG'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "DEBUG" -MsgLevel "DEBUG" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'DEBUG' and MsgLevel is 'INFO'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "DEBUG" -MsgLevel "INFO" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'DEBUG' and MsgLevel is 'WARN'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "DEBUG" -MsgLevel "WARN" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'DEBUG' and MsgLevel is 'ERROR'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "DEBUG" -MsgLevel "ERROR" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'DEBUG' and MsgLevel is 'FATAL'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "DEBUG" -MsgLevel "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'DEBUG' and MsgLevel is 'CONSOLEONLY'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "DEBUG" -MsgLevel "CONSOLEONLY" | Should be consoleOnly
    }
    #INFO
    It "Should be 'consoleOnly' when RunLogLevel is set to 'INFO' and MsgLevel is 'TRACE'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "INFO" -MsgLevel "TRACE" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'INFO' and MsgLevel is 'DEBUG'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "INFO" -MsgLevel "DEBUG" | Should be consoleOnly
    }
    It "Should be 'both' when RunLogLevel is set to 'INFO' and MsgLevel is 'INFO'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "INFO" -MsgLevel "INFO" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'INFO' and MsgLevel is 'WARN'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "INFO" -MsgLevel "WARN" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'INFO' and MsgLevel is 'ERROR'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "INFO" -MsgLevel "ERROR" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'INFO' and MsgLevel is 'FATAL'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "INFO" -MsgLevel "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'INFO' and MsgLevel is 'CONSOLEONLY'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "INFO" -MsgLevel "CONSOLEONLY" | Should be consoleOnly
    }
    #WARN
    It "Should be 'consoleOnly' when RunLogLevel is set to 'WARN' and MsgLevel is 'TRACE'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "WARN" -MsgLevel "TRACE" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'WARN' and MsgLevel is 'DEBUG'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "WARN" -MsgLevel "DEBUG" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'WARN' and MsgLevel is 'INFO'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "WARN" -MsgLevel "INFO" | Should be consoleOnly
    }
    It "Should be 'both' when RunLogLevel is set to 'WARN' and MsgLevel is 'WARN'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "WARN" -MsgLevel "WARN" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'WARN' and MsgLevel is 'ERROR'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "WARN" -MsgLevel "ERROR" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'WARN' and MsgLevel is 'FATAL'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "WARN" -MsgLevel "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'WARN' and MsgLevel is 'CONSOLEONLY'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "WARN" -MsgLevel "CONSOLEONLY" | Should be consoleOnly
    }
    #ERROR
    It "Should be 'consoleOnly' when RunLogLevel is set to 'ERROR' and MsgLevel is 'TRACE'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "ERROR" -MsgLevel "TRACE" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'ERROR' and MsgLevel is 'DEBUG'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "ERROR" -MsgLevel "DEBUG" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'ERROR' and MsgLevel is 'INFO'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "ERROR" -MsgLevel "INFO" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'ERROR' and MsgLevel is 'WARN'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "ERROR" -MsgLevel "WARN" | Should be consoleOnly
    }
    It "Should be 'both' when RunLogLevel is set to 'ERROR' and MsgLevel is 'ERROR'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "ERROR" -MsgLevel "ERROR" | Should be both
    }
    It "Should be 'both' when RunLogLevel is set to 'ERROR' and MsgLevel is 'FATAL'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "ERROR" -MsgLevel "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'ERROR' and MsgLevel is 'CONSOLEONLY'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "ERROR" -MsgLevel "CONSOLEONLY" | Should be consoleOnly
    }
    #FATAL
    It "Should be 'consoleOnly' when RunLogLevel is set to 'FATAL' and MsgLevel is 'TRACE'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "FATAL" -MsgLevel "TRACE" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'FATAL' and MsgLevel is 'DEBUG'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "FATAL" -MsgLevel "DEBUG" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'FATAL' and MsgLevel is 'INFO'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "FATAL" -MsgLevel "INFO" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'FATAL' and MsgLevel is 'WARN'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "FATAL" -MsgLevel "WARN" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'FATAL' and MsgLevel is 'ERROR'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "FATAL" -MsgLevel "ERROR" | Should be consoleOnly
    }
    It "Should be 'both' when RunLogLevel is set to 'FATAL' and MsgLevel is 'FATAL'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "FATAL" -MsgLevel "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when RunLogLevel is set to 'FATAL' and MsgLevel is 'CONSOLEONLY'." {
        Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "FATAL" -MsgLevel "CONSOLEONLY" | Should be consoleOnly
    }
    It "Should Throw when it cannot write a message to file." {
        Mock -CommandName 'Write-Log' -MockWith {
            Throw "Unable to call Write-Log"
        }
        {Write-LogLevel -Message "Test" -LogFile "FakePath" -RunLogLevel "All" -MsgLevel "DEBUG"} | Should -Throw
        Assert-MockCalled -CommandName 'Write-Log' -Times 1 -Exactly
    }
}