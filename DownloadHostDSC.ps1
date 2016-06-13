configuration DownloadHostDSC
{
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
    Import-DscResource -ModuleName 'cSABnzbd'
    Import-DscResource -ModuleName 'cSonarr'    

    cSABnzbdInstall SABnzbdInstaller
    {
        Ensure    = 'Present'
    }
    
    cSonarrInstall SonarrInstaller
    {
        Ensure    = 'Present'
        DependsOn = '[cSABnzbdInstall]SABnzbdInstaller'
    }

}

DownloadHostDSC -OutputPath C:\DSCConfiguration
Enable-PSRemoting -Force -SkipNetworkProfileCheck
Start-DSCConfiguration -Wait -Force -Verbose -Path C:\DSCConfiguration