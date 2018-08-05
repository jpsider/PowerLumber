# PowerLumber

Simple Powershell Logging Module

[![Build status](https://ci.appveyor.com/api/projects/status/github/jpsider/powerlumber?branch=master&svg=true)](https://ci.appveyor.com/project/JustinSider/powerlumber)
[![PS Gallery](https://img.shields.io/badge/install-PS%20Gallery-blue.svg)](https://www.powershellgallery.com/packages/powerlumber/)
[![Coverage Status](https://coveralls.io/repos/github/jpsider/powerlumber/badge.svg?branch=master)](https://coveralls.io/github/jpsider/powerlumber?branch=master)

## Docs  

[Help](https://github.com/jpsider/powerlumber/tree/master/docs)

## GitPitch PitchMe presentation

* [gitpitch.com/jpsider/PowerLumber](https://gitpitch.com/jpsider/PowerLumber)

## Getting Started

Install from the PSGallery and Import the module

    Install-Module PowerLumber
    Import-Module PowerLumber


## More Information

For more information

* [github.com/jpsider/PowerLumber](https://github.com/jpsider/PowerLumber)

This project was generated using [Kevin Marquette](http://kevinmarquette.github.io)'s [Full Module Plaster Template](https://github.com/KevinMarquette/PlasterTemplates/tree/master/FullModuleTemplate).

# PowerLumber
![Alt text](https://github.com/jpsider/PowerLumber/blob/master/Images/PowerLumber_small.png "PowerLumber Icon")  

## Overview  
This powershell module includes commands to assist with logging.    

## Requirements  
Powershell version 5.0 (It may work with older versions, but its not tested.) 

## Installation  
### Download the file and run the following line:  
Import-Module \<path>\PowerLumber.psm1  

### Copy and paste these lines. c:\temp needs to exist.  
      $webclient = New-Object System.Net.WebClient  
      $filepath = "C:\temp\PowerLumber.psm1"  
      $url = "https://raw.github.com/jpsider/PowerLumber/master/PowerLumber.psm1"  
      $webclient.DownloadFile($url,$filepath)  
      Import-module $filepath  

## Available Functions 
Clear-LogDirectory   
New-Log  
Write-Log  
Invoke-RollLog  
Write-LogLevel  

## Examples:  
### Create New Log file  
    New-Log -logfile c:\temp\new.log  
### Clear log files in path older than specified days  
    Clear-LogDirectory -Path "c:\temp" -DaysBack 3  
### Log a message to logfile with no console output  
    Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle noConsole  
### Log a message to logfile with console output  
    Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle both  
### Log a message with only console output (not sure why'd you would specify a log file, but you can!)  
    Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle consoleOnly  
### Log a message to logfile with console output  
    Write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log"                        
### Log a message with only console output  
    Write-Log -Message "I love lamp" -OutputStyle consoleOnly  

## Understanding Write-LogLevel  
    -RunLogLevel is meant to be a system/script wide Level  
    -MsgLevel is meant to be for a specific Log Message  
### This Module will only write Equal or Lower LogLevels based on the Message Level compared to the -RunLogLevel
#### Setting -RunLogLevel to All, will force all Messages to be written and displayed.  
    Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel All -MsgLevel TRACE  
#### Setting -RunLogLevel to CONSOLEONLY will not write any messages, all log messages will be displayed to the console  
    Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel CONSOLEONLY -MsgLevel CONSOLEONLY  
#### The next two examples will log different items  
##### Logs a Warning message to a log file and console  
    Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel WARN -MsgLevel WARN  
##### Logs a DEBUG Message to the console Only. No message written to a log file.  
    Write-LogLevel -Message "I love lamp" -Logfile "C:\temp\mylog.log" -RunLogLevel FATAL -MsgLevel DEBUG  
