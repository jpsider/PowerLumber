---
external help file: PowerLumber-help.xml
Module Name: powerlumber
online version:
schema: 2.0.0
---

# Write-LogLevel

## SYNOPSIS
Function to write log files, based on a set LogLevel.

## SYNTAX

```
Write-LogLevel [-Message] <String> [-Logfile] <String> [-RunLogLevel] <String> [-MsgLevel] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Writes messages to log file based on a set LogLevel.
-RunLogLevel is the System Wide setting.
-MsgLevel is specific to a message.

## EXAMPLES

### EXAMPLE 1
```
Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel All -MsgLevel TRACE
```

### EXAMPLE 2
```
Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel TRACE -MsgLevel TRACE
```

### EXAMPLE 3
```
Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel DEBUG -MsgLevel DEBUG
```

### EXAMPLE 4
```
Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel INFO -MsgLevel INFO
```

### EXAMPLE 5
```
Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel WARN -MsgLevel WARN
```

### EXAMPLE 6
```
Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel ERROR -MsgLevel ERROR
```

### EXAMPLE 7
```
Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel FATAL -MsgLevel FATAL
```

### EXAMPLE 8
```
Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel CONSOLEONLY -MsgLevel CONSOLEONLY
```

### EXAMPLE 9
```
Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel OFF -MsgLevel OFF
```

## PARAMETERS

### -Message
Please Specify a message.

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

### -Logfile
Please Specify a valid logfile.

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

### -RunLogLevel
Please specify a Running Log Level.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MsgLevel
Please specify a Message Log Level.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
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
