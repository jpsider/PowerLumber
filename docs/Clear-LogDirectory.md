---
external help file: PowerLumber-help.xml
Module Name: powerlumber
online version:
schema: 2.0.0
---

# Clear-LogDirectory

## SYNOPSIS
Clears logs in a directory older than the specified number of days.

## SYNTAX

```
Clear-LogDirectory [-Path] <String> [-DaysBack] <Int32> [<CommonParameters>]
```

## DESCRIPTION
Clears logs in a directory older than the specified number of days.

## EXAMPLES

### EXAMPLE 1
```
Clear-LogDirectory -Path "c:\temp" -DaysBack 3
```

## PARAMETERS

### -Path
Please Specify a valid path.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DaysBack
Please Specify a number of daysback.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
No Additional information about the function or script.

## RELATED LINKS
