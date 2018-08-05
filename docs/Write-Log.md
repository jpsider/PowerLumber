---
external help file: PowerLumber-help.xml
Module Name: powerlumber
online version:
schema: 2.0.0
---

# Write-Log

## SYNOPSIS
Function to write log files, option to print to console.

## SYNTAX

### LogFileFalse (Default)
```
Write-Log -Message <String> -OutputStyle <String> [<CommonParameters>]
```

### LogFileTrue
```
Write-Log -Message <String> -Logfile <String> [-OutputStyle <String>] [<CommonParameters>]
```

## DESCRIPTION
Writes messages to log file and optional console.

## EXAMPLES

### EXAMPLE 1
```
Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle noConsole
```

### EXAMPLE 2
```
Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle both
```

### EXAMPLE 3
```
Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle consoleOnly
```

### EXAMPLE 4
```
Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log"
```

### EXAMPLE 5
```
Write-Log -Message "I love lamp" -OutputStyle ConsoleOnly
```

## PARAMETERS

### -Message
Please Specify a message.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Logfile
Please Specify a valid logfile.

```yaml
Type: String
Parameter Sets: LogFileTrue
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputStyle
Please specify an output OutputStyle.

```yaml
Type: String
Parameter Sets: LogFileFalse
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

```yaml
Type: String
Parameter Sets: LogFileTrue
Aliases:

Required: False
Position: Named
Default value: None
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
