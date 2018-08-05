$script:ModuleName = 'PowerLumber'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "New-Log function for $moduleName" {
    It "Should not Throw when a new file is created." {
        function Split-Path {}
        function write-Log {}
        function New-Item {}
        Mock -CommandName 'New-Item' -MockWith {
            $true
        }
        Mock -CommandName 'Split-Path' -MockWith {
            $true
        }
        Mock -CommandName 'Write-Log' -MockWith {
            $true
        }
        {New-Log -Logfile "c:\fakepath\new.log"} | Should -not -Throw
        Assert-MockCalled -CommandName 'Split-Path' -Times 1 -Exactly
        Assert-MockCalled -CommandName 'Write-Log' -Times 1 -Exactly
        Assert-MockCalled -CommandName 'New-Item' -Times 1 -Exactly
    }
    It "Should not Throw when a new directory is created." {
        function Split-Path {}
        function write-Log {}
        function New-Item {}
        Mock -CommandName 'New-Item' -MockWith {
            $true
        }
        Mock -CommandName 'Split-Path' -MockWith {
            $false
        }
        Mock -CommandName 'Write-Log' -MockWith {
            $true
        }
        {New-Log -Logfile "c:\fakepath\new.log"} | Should -not -Throw
        Assert-MockCalled -CommandName 'Split-Path' -Times 3 -Exactly
        Assert-MockCalled -CommandName 'Write-Log' -Times 3 -Exactly
        Assert-MockCalled -CommandName 'New-Item' -Times 3 -Exactly
    }
    It "Should Throw when a bad path is passed in" {
        function Split-Path {}
        Mock -CommandName 'Split-Path' -MockWith {
            Throw "Unable to Split-Path."
        }
        {New-Log -Logfile "c:\fakepath\new.log"} | Should -Throw
        Assert-MockCalled -CommandName 'Split-Path' -Times 4 -Exactly
    }
    It "Should Throw when a new is not created." {
        function Split-Path {}
        function write-Log {}
        function New-Item {}
        Mock -CommandName 'New-Item' -MockWith {
            throw "Unable to create file"
        }
        Mock -CommandName 'Split-Path' -MockWith {
            $false
        }
        Mock -CommandName 'Write-Log' -MockWith {
            $true
        }
        {New-Log -Logfile "c:\fakepath\new.log"} | Should -Throw
        Assert-MockCalled -CommandName 'Split-Path' -Times 6 -Exactly
        Assert-MockCalled -CommandName 'Write-Log' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'New-Item' -Times 4 -Exactly
    }
    It "Should Throw when a new directory is not created." {
        function Split-Path {}
        function write-Log {}
        function New-Item {}
        Mock -CommandName 'New-Item' -MockWith {
            $false
        }
        Mock -CommandName 'Split-Path' -MockWith {
            $true
        }
        Mock -CommandName 'Write-Log' -MockWith {
            $true
        }
        {New-Log -Logfile "c:\fakepath\new.log"} | Should -not -Throw
        Assert-MockCalled -CommandName 'Split-Path' -Times 7 -Exactly
        Assert-MockCalled -CommandName 'Write-Log' -Times 5 -Exactly
        Assert-MockCalled -CommandName 'New-Item' -Times 5 -Exactly
    }
}