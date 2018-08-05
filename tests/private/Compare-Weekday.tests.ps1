$script:ModuleName = 'PowerLumber'

$here = (Split-Path -Parent $MyInvocation.MyCommand.Path) -replace 'tests', "$script:ModuleName"
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Compare-Weekday function for $moduleName" {
    $Today = (Get-Date).DayOfWeek
    It "Should return True if the days Match." {
        Compare-Weekday -Weekday $Today | Should be $true
    }
    $Yesterday = (((Get-Date).AddDays(-2)).DayOfWeek)
    It "Should return false if the days do not Match." {
        Compare-Weekday -Weekday $Yesterday | Should be $false
    }
    It "Should return false if no day was passed in." {
        Compare-Weekday | Should be $false
    }
}