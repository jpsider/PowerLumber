$script:ModuleName = 'PowerLumber'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"


Describe "Write-Log function for $moduleName" {
    function Write-Message
    {
        param(
            [string]$OutputStyle
        )
        return $OutPutStyle
    }
    #OFF
    It "Should be 'None' when LogLevel is set to 'OFF'" {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "OFF" -MsgType "CONSOLEONLY" | Should be None
    }
    #ALL
    It "Should be 'both' when LogLevel is set to 'All'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "All" -MsgType "DEBUG" | Should be both
    }
    #TRACE
    It "Should be 'both' when LogLevel is set to 'TRACE'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "TRACE" -MsgType "DEBUG" | Should be both
    }
    #CONSOLEONLY
    It "Should be 'consoleOnly' when LogLevel is set to 'CONSOLEONLY'." {
        Write-Log -Message "Test" -LogLevel "CONSOLEONLY" -MsgType "DEBUG" | Should be consoleOnly
    }
    #DEBUG
    It "Should be 'consoleOnly' when LogLevel is set to 'DEBUG' and MsgType is 'TRACE'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "DEBUG" -MsgType "TRACE" | Should be consoleOnly
    }
    It "Should be 'both' when LogLevel is set to 'DEBUG' and MsgType is 'DEBUG'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "DEBUG" -MsgType "DEBUG" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'DEBUG' and MsgType is 'INFO'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "DEBUG" -MsgType "INFO" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'DEBUG' and MsgType is 'WARN'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "DEBUG" -MsgType "WARN" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'DEBUG' and MsgType is 'ERROR'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "DEBUG" -MsgType "ERROR" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'DEBUG' and MsgType is 'FATAL'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "DEBUG" -MsgType "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'DEBUG' and MsgType is 'CONSOLEONLY'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "DEBUG" -MsgType "CONSOLEONLY" | Should be consoleOnly
    }
    #INFO
    It "Should be 'consoleOnly' when LogLevel is set to 'INFO' and MsgType is 'TRACE'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "INFO" -MsgType "TRACE" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'INFO' and MsgType is 'DEBUG'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "INFO" -MsgType "DEBUG" | Should be consoleOnly
    }
    It "Should be 'both' when LogLevel is set to 'INFO' and MsgType is 'INFO'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "INFO" -MsgType "INFO" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'INFO' and MsgType is 'WARN'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "INFO" -MsgType "WARN" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'INFO' and MsgType is 'ERROR'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "INFO" -MsgType "ERROR" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'INFO' and MsgType is 'FATAL'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "INFO" -MsgType "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'INFO' and MsgType is 'CONSOLEONLY'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "INFO" -MsgType "CONSOLEONLY" | Should be consoleOnly
    }
    #WARN
    It "Should be 'consoleOnly' when LogLevel is set to 'WARN' and MsgType is 'TRACE'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "WARN" -MsgType "TRACE" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'WARN' and MsgType is 'DEBUG'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "WARN" -MsgType "DEBUG" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'WARN' and MsgType is 'INFO'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "WARN" -MsgType "INFO" | Should be consoleOnly
    }
    It "Should be 'both' when LogLevel is set to 'WARN' and MsgType is 'WARN'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "WARN" -MsgType "WARN" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'WARN' and MsgType is 'ERROR'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "WARN" -MsgType "ERROR" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'WARN' and MsgType is 'FATAL'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "WARN" -MsgType "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'WARN' and MsgType is 'CONSOLEONLY'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "WARN" -MsgType "CONSOLEONLY" | Should be consoleOnly
    }
    #ERROR
    It "Should be 'consoleOnly' when LogLevel is set to 'ERROR' and MsgType is 'TRACE'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "ERROR" -MsgType "TRACE" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'ERROR' and MsgType is 'DEBUG'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "ERROR" -MsgType "DEBUG" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'ERROR' and MsgType is 'INFO'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "ERROR" -MsgType "INFO" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'ERROR' and MsgType is 'WARN'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "ERROR" -MsgType "WARN" | Should be consoleOnly
    }
    It "Should be 'both' when LogLevel is set to 'ERROR' and MsgType is 'ERROR'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "ERROR" -MsgType "ERROR" | Should be both
    }
    It "Should be 'both' when LogLevel is set to 'ERROR' and MsgType is 'FATAL'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "ERROR" -MsgType "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'ERROR' and MsgType is 'CONSOLEONLY'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "ERROR" -MsgType "CONSOLEONLY" | Should be consoleOnly
    }
    #FATAL
    It "Should be 'consoleOnly' when LogLevel is set to 'FATAL' and MsgType is 'TRACE'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "FATAL" -MsgType "TRACE" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'FATAL' and MsgType is 'DEBUG'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "FATAL" -MsgType "DEBUG" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'FATAL' and MsgType is 'INFO'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "FATAL" -MsgType "INFO" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'FATAL' and MsgType is 'WARN'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "FATAL" -MsgType "WARN" | Should be consoleOnly
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'FATAL' and MsgType is 'ERROR'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "FATAL" -MsgType "ERROR" | Should be consoleOnly
    }
    It "Should be 'both' when LogLevel is set to 'FATAL' and MsgType is 'FATAL'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "FATAL" -MsgType "FATAL" | Should be both
    }
    It "Should be 'consoleOnly' when LogLevel is set to 'FATAL' and MsgType is 'CONSOLEONLY'." {
        Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "FATAL" -MsgType "CONSOLEONLY" | Should be consoleOnly
    }
    It "Should Throw when it cannot write a message to file." {
        Mock -CommandName 'Write-Message' -MockWith {
            Throw "Unable to call Write-Message"
        }
        {Write-Log -Message "Test" -LogFile "FakePath" -LogLevel "All" -MsgType "DEBUG"} | Should -Throw
        Assert-MockCalled -CommandName 'Write-Message' -Times 1 -Exactly
    }
}