﻿Configuration Main
{

    [CmdletBinding()] 
    Param (
    [string]$serviceName
    )
    
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    node $AllNodes.Where{$_.Role -eq "WebServer"}.Nodename
    {
        
        WindowsFeature iis
        {
            Name = $serviceName
            Ensure = $AllNodes.Where{$_.Role -eq "WebServer"}.IsPresent


        }
    }
} 
