$script:ModuleName = 'PowerLumber'
Describe "Write-Log function for $moduleName" {
    function New-Log {}
    It "Should not Throw." {
        Mock -CommandName 'Write-Output' -MockWith {}
        {Write-Log -Message "I love lamp" -Logfile "C:\fakepath\mylog.log" -OutputStyle noConsole} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 1 -Exactly
    }
    It "Should not Throw." {
        Mock -CommandName 'Write-Output' -MockWith {}
        Mock -CommandName 'Write-Warning' -MockWith {}
        Mock -CommandName 'Test-Path' -MockWith {
            $false
        }
        {Write-Log -Message "I love lamp" -Logfile "C:\fakepath\mylog.log" -OutputStyle both} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'Write-Warning' -Times 1 -Exactly
    }
    It "Should not Throw." {
        Mock -CommandName 'Write-Output' -MockWith {}
        {Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle consoleOnly} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 6 -Exactly
    }
    It "Should not Throw." {
        Mock -CommandName 'Write-Output' -MockWith {}
        {Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log"} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 9 -Exactly
    }
    It "Should not Throw." {
        Mock -CommandName 'Write-Output' -MockWith {}
        {Write-Log -Message "I love lamp" -OutputStyle ConsoleOnly} | Should -not -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 11 -Exactly
    }
    It "Should Throw." {
        Mock -CommandName 'Write-Output' -MockWith {
            Throw "Could not Write-Output"
        }
        {Write-Log -Message "I love lamp" -OutputStyle ConsoleOnly} | Should -Throw
        Assert-MockCalled -CommandName 'Write-Output' -Times 12 -Exactly
    }
}