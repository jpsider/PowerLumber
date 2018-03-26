$script:ModuleName = 'PowerLumber'
Describe "Clear-LogDirectory function for $moduleName" {
    function Write-Log {}
    It "Should not Throw." {
        function Remove-Item {}
        function Get-ChildItem {}
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        Mock -CommandName 'Get-ChildItem' -MockWith {
            $true
        }
        {Clear-LogDirectory -Path "c:\fakepath" -DaysBack 3} | Should -not -Throw
        Assert-MockCalled -CommandName 'Get-ChildItem' -Times 2 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 1 -Exactly
    }
    It "Should not Throw if the directory is empty." {
        function Remove-Item {}
        function Get-ChildItem {}
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        Mock -CommandName 'Get-ChildItem' -MockWith {
            $false
        }
        {Clear-LogDirectory -Path "c:\fakepath" -DaysBack 3} | Should -not -Throw
        Assert-MockCalled -CommandName 'Get-ChildItem' -Times 3 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 2 -Exactly
    }
    It "Should Throw if we cannot check a directory that is not empty." {
        function Remove-Item {}
        function Get-ChildItem {}
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        Mock -CommandName 'Get-ChildItem' -MockWith {
            Throw "Unable to check Directory structure."
        }
        {Clear-LogDirectory -Path "c:\fakepath" -DaysBack 3} | Should -Throw
        Assert-MockCalled -CommandName 'Get-ChildItem' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 3 -Exactly
    }
    It "Should not Throw if files can be removed" {
        function Remove-Item {}
        function Get-ChildItem {}
        Mock -CommandName 'Test-Path' -MockWith {
            $true
        }
        Mock -CommandName 'Remove-Item' -MockWith {
            $true
        }
        Mock -CommandName 'Get-ChildItem' -MockWith {
            $true
        }
        {Clear-LogDirectory -Path "c:\fakepath" -DaysBack 3} | Should -not -Throw
        Assert-MockCalled -CommandName 'Get-ChildItem' -Times 6 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 4 -Exactly
        Assert-MockCalled -CommandName 'Remove-Item' -Times 1 -Exactly
    }
    It "Should Throw if files cannot be removed." {
        function Remove-Item {}
        function Get-ChildItem {}
        Mock -CommandName 'Remove-Item' -MockWith {
            Throw "Unable to remove Items"
        }
        Mock -CommandName 'Get-ChildItem' -MockWith {
            $true
        }
        {Clear-LogDirectory -Path "c:\fakepath" -DaysBack 3} | Should -Throw
        Assert-MockCalled -CommandName 'Get-ChildItem' -Times 8 -Exactly
        Assert-MockCalled -CommandName 'Test-Path' -Times 5 -Exactly
        Assert-MockCalled -CommandName 'Remove-Item' -Times 2 -Exactly
    }
}