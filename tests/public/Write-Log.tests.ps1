$script:ModuleName = 'PowerLumber'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Write-Log function for $moduleName" {
    function New-Log {}
    function Write-Output {}
    function Test-Path {}
    function Out-File {}
    function Write-Warning {}
    function Get-Timestamp {}
    It "Should not Throw if the log file does exist" {
        Mock -CommandName 'Write-Output' -MockWith {
            $true
        }
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        Mock -CommandName 'Write-Warning' -MockWith {}
        Mock -CommandName 'New-Log' -MockWith {}
        Mock -CommandName 'Get-Timestamp' -MockWith {}
        {Write-Log -Message "I love lamp" -Logfile "C:\fakepath\mylog.log" -OutputStyle noConsole} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 1 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 0 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 1 -Exactly
        Assert-MockCalled -CommandName 'New-Log' -Times 0 -Exactly
    }
    It "Should not Throw if the log file does not exist." {
        Mock -CommandName 'Write-Warning' -MockWith {}
        Mock -CommandName 'Write-Output' -MockWith {
            $true
        }
        Mock -CommandName 'Test-Path' -MockWith {
            $False
        }
        Mock -CommandName 'New-Log' -MockWith {}
		Mock -CommandName 'Get-Timestamp' -MockWith {}
        {Write-Log -Message "I love lamp" -Logfile "C:\fakepath\mylog.log" -OutputStyle noConsole} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 2 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 1 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 2 -Exactly
        Assert-MockCalled -CommandName 'New-Log' -Times 1 -Exactly
    }
    It "Should Throw if the log file does not exist and could not be created." {
        Mock -CommandName 'Write-Output' -MockWith {
            $true
        }
        Mock -CommandName 'Test-Path' -MockWith {
            $False
        }
        Mock -CommandName 'New-Log' -MockWith {
            Throw "Could not create Log file."
        }
        Mock -CommandName 'Write-Warning' -MockWith {}
		Mock -CommandName 'Get-Timestamp' -MockWith {}
        {Write-Log -Message "I love lamp" -Logfile "C:\fakepath\mylog.log" -OutputStyle noConsole} | Should -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 2 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 2 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 3 -Exactly
        Assert-MockCalled -CommandName 'New-Log' -Times 2 -Exactly
    }
    It "Should not Throw." {
        Mock -CommandName 'Write-Output' -MockWith {}
        Mock -CommandName 'Write-Warning' -MockWith {}
        Mock -CommandName 'New-Log' -MockWith {}
		Mock -CommandName 'Get-Timestamp' -MockWith {}
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        {Write-Log -Message "I love lamp" -Logfile "C:\fakepath\mylog.log" -OutputStyle both} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 5 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 2 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'New-Log' -Times 2 -Exactly
    }
    It "Should not Throw -output style both, failed test-path." {
        Mock -CommandName 'Write-Output' -MockWith {}
        Mock -CommandName 'New-Log' -MockWith {}
		Mock -CommandName 'Get-Timestamp' -MockWith {}
        Mock -CommandName 'Test-Path' -MockWith {
            $false
        }
        Mock -CommandName 'Write-Warning' -MockWith {}
        {Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle both} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 8 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 3 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 5 -Exactly
        Assert-MockCalled -CommandName 'New-Log' -Times 3 -Exactly
    }
    It "Should not Throw. No output style." {
        Mock -CommandName 'Write-Output' -MockWith {}
        Mock -CommandName 'New-Log' -MockWith {}
		Mock -CommandName 'Get-Timestamp' -MockWith {}
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        Mock -CommandName 'Write-Warning' -MockWith {}
        {Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log"} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 11 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 3 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 6 -Exactly
        Assert-MockCalled -CommandName 'New-Log' -Times 3 -Exactly
    }
    It "Should not Throw. no output style, test-path failed." {
        Mock -CommandName 'Write-Output' -MockWith {}
        Mock -CommandName 'New-Log' -MockWith {}
		Mock -CommandName 'Get-Timestamp' -MockWith {}
        Mock -CommandName 'Test-Path' -MockWith {
            $false
        }
        Mock -CommandName 'Write-Warning' -MockWith {}
        {Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log"} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 14 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 7 -Exactly
        Assert-MockCalled -CommandName 'New-Log' -Times 4 -Exactly
    }
    It "Should not Throw. ConsoleOnly" {
        Mock -CommandName 'Write-Output' -MockWith {}
        Mock -CommandName 'Write-Warning' -MockWith {}
        Mock -CommandName 'New-Log' -MockWith {}
		Mock -CommandName 'Get-Timestamp' -MockWith {}
        {Write-Log -Message "I love lamp" -OutputStyle ConsoleOnly} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 16 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 7 -Exactly
        Assert-MockCalled -CommandName 'New-Log' -Times 4 -Exactly
    }
    It "Should Throw. Console Only, Write-Output failed" {
        Mock -CommandName 'Write-Output' -MockWith {
            Throw "Could not Write-Output"
        }
        Mock -CommandName 'Write-Warning' -MockWith {}
        Mock -CommandName 'New-Log' -MockWith {}
		Mock -CommandName 'Get-Timestamp' -MockWith {}
        {Write-Log -Message "I love lamp" -OutputStyle ConsoleOnly} | Should -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 17 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 7 -Exactly
        Assert-MockCalled -CommandName 'New-Log' -Times 4 -Exactly
    }
}