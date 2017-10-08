# PowerLumber

Simple Powershell Logging Module

## GitPitch PitchMe presentation

* [gitpitch.com/jpsider/PowerLumber](https://gitpitch.com/jpsider/PowerLumber)

## Getting Started

Install from the PSGallery and Import the module

    Install-Module PowerLumber
    Import-Module PowerLumber


## More Information

For more information

* [PowerLumber.readthedocs.io](http://PowerLumber.readthedocs.io)
* [github.com/jpsider/PowerLumber](https://github.com/jpsider/PowerLumber)
* [jpsider.github.io](https://jpsider.github.io)


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
Clear-Logs  
Get-Timestamp  
new-Log  
write-Log  

## Examples:  
### Create New Log file  
    new-log -logfile c:\temp\new.log  
### Clear log files in path older than specified days  
    Clear-Logs -Path "c:\temp" -DaysBack 3  
### Get a timestamp  
    $datenow = Get-Timestamp  
### Log a message to logfile with no console output  
    write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle noConsole  
### Log a message to logfile with console output  
    write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle both  
### Log a message with only console output (not sure why'd you would specify a log file, but you can!)  
    write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log" -OutputStyle consoleOnly  
### Log a message to logfile with console output  
    write-Log -Message "I love lamp" -Logfile "C:\temp\mylog.log"                        
### Log a message with only console output  
    write-Log -Message "I love lamp" -OutputStyle consoleOnly  
