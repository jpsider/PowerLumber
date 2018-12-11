$script:ModuleName = 'PowerLumber'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Invoke-RollLog function for $moduleName" {
    function Write-Message {}
    It "Should Throw if the Logfile does not exist." {
        Mock -CommandName 'Test-Path' -MockWith {
            $false
        }
        {Invoke-RollLog -LogFile "c:\fakepath\test.log" -Weekday Tuesday} | Should -Throw
        Assert-MockCalled -CommandName 'Test-Path' -Times 1 -Exactly
    }
    It "Should Throw if get-date cannot be processed." {
        function Compare-Weekday {}
        Mock -CommandName 'Compare-Weekday' -MockWith {
            $false
        }
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        Mock -CommandName 'Get-Date' -MockWith {
            Throw "Unable to get-date."
        }
        {Invoke-RollLog -LogFile "c:\fakepath\test.log" -Weekday Tuesday} | Should -Throw
        Assert-MockCalled -CommandName 'Test-Path' -Times 2 -Exactly
        Assert-MockCalled -CommandName 'Compare-Weekday' -Times 1 -Exactly
        Assert-MockCalled -CommandName 'Get-Date' -Times 1 -Exactly
    }
    It "Should not Throw if the day is the same." {
        function Compare-Weekday {}
        Mock -CommandName 'Compare-Weekday' -MockWith {
            $true
        }
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        {Invoke-RollLog -LogFile "c:\fakepath\test.log" -Weekday Tuesday} | Should -not -Throw
        Assert-MockCalled -CommandName 'Test-Path' -Times 3 -Exactly
        Assert-MockCalled -CommandName 'Compare-Weekday' -Times 2 -Exactly
    }
    It "Should not Throw if the day is different." {
        function Compare-Weekday {}
        function Rename-Item {}
        Mock -CommandName 'Rename-Item' -MockWith {
            $true
        }
        Mock -CommandName 'Get-Date' -MockWith {
            $true
        }
        Mock -CommandName 'Compare-Weekday' -MockWith {
            $false
        }
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        {Invoke-RollLog -LogFile "c:\fakepath\test.log" -Weekday Tuesday} | Should -not -Throw
        Assert-MockCalled -CommandName 'Test-Path' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'Compare-Weekday' -Times 3 -Exactly
        Assert-MockCalled -CommandName 'Rename-Item' -Times 1 -Exactly
    }
    It "Should Throw if the day is different." {
        function Compare-Weekday {}
        function Rename-Item {}
        Mock -CommandName 'Rename-Item' -MockWith {
            Throw "Could not Rename-Item"
        }
        Mock -CommandName 'Get-Date' -MockWith {
            $true
        }
        Mock -CommandName 'Compare-Weekday' -MockWith {
            $false
        }
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        {Invoke-RollLog -LogFile "c:\fakepath\test.log" -Weekday Tuesday} | Should  -Throw
        Assert-MockCalled -CommandName 'Test-Path' -Times 5 -Exactly
        Assert-MockCalled -CommandName 'Compare-Weekday' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'Rename-Item' -Times 2 -Exactly
    }
}