configuration DownloadHostDSC
{
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'cSABnzbd'
    Import-DscResource -ModuleName 'cSonarr'    

    cSABnzbd SABnzbdInstaller
    {
        Ensure    = 'Present'
    }
    
    cSonarr SonarrInstaller
    {
        Ensure    = 'Present'
        DependsOn = '[cSABnzbd]SABnzbdInstaller'
    }

}

DownloadHostDSC -OutputPath C:\DSCConfiguration
Enable-PSRemoting -Force -SkipNetworkProfileCheck
Start-DSCConfiguration -Wait -Force -Verbose -Path C:\DSCConfiguration