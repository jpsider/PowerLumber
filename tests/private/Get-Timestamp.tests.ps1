$script:ModuleName = 'PowerLumber'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

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