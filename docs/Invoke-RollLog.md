---
external help file: PowerLumber-help.xml
Module Name: powerlumber
online version:
schema: 2.0.0
---

# Invoke-RollLog

## SYNOPSIS

## SYNTAX

```
Invoke-RollLog [-Logfile] <String> [-Weekday] <String> [<CommonParameters>]
```

## DESCRIPTION
This function will Roll the log file if it is a new week day.

## EXAMPLES

### EXAMPLE 1
```
Invoke-RollLogs -LogFile "c:\temp\test.log" -Weekday Tuesday
```

## PARAMETERS

### -Logfile
A valid file path is required.

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

### -Weekday
A valid Weekday in datetime format is required.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Boolean

## NOTES
It's pretty simple.

## RELATED LINKS
