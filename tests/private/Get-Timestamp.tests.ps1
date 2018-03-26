$script:ModuleName = 'PowerLumber'
Describe "Get-Timestamp function for $moduleName" {
    It "Should not Throw." {
        {Get-Timestamp} | Should -not -Throw
    }
    It "Should Throw." {
        Mock -CommandName 'Get-Date' -MockWith {
            Throw "Unable to get-date."
        }
        {Get-Timestamp} | Should -Throw
        Assert-MockCalled -CommandName 'Get-Date' -Times 1 -Exactly
    }
}