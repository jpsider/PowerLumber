function Compare-Weekday
{
    <#
	.DESCRIPTION
		Determine if the day of the week has changed since the last check.
    .PARAMETER Weekday
        A valid Day of the week is required.
	.EXAMPLE
        Compare-Weekday -Weekday Tuesday
	.NOTES
        It will return boolean
    #>
    [CmdletBinding()]
    [OutputType([boolean])]
    param(
        $Weekday = $null
    )
    if ($null -eq $Weekday)
    {
        # No day was passed in (This is acceptable.)
        Return $false
    }
    else
    {
        $CurrentDay = (Get-Date).DayOfWeek
        if ($CurrentDay -eq $Weekday)
        {
            # The days match.
            $true
        }
        else
        {
            # The days do not match.
            $false
        }
    }
}