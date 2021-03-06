function Show-IcingaForWindowsInstallerMenuSelectConnection()
{
    param (
        [array]$Value          = @(),
        [string]$DefaultInput  = '0',
        [switch]$JumpToSummary = $FALSE,
        [switch]$Automated     = $FALSE,
        [switch]$Advanced      = $FALSE
    );

    Show-IcingaForWindowsInstallerMenu `
        -Header 'How do you want to configure your local Icinga Agent?' `
        -Entries @(
            @{
                'Caption' = 'Connecting from this system';
                'Command' = 'Show-IcingaForWindowsInstallerMenuSelectHostname';
                'Help'    = 'Choose this option if your Icinga Agent should only connect to a parent Icinga node. This is the easiest configuration as certificate generation is done automatically.'
            },
            @{
                'Caption' = 'Connecting from parent system';
                'Command' = 'Show-IcingaForWindowsInstallerMenuSelectHostname';
                'Help'    = 'Choose this option if the Icinga Agent should not or cannot connect to a parent Icinga node and only connections from a Master/Satellite are possible. This will open the Windows firewall for the chosen Icinga protocol port (default 5665). Certificate generation might require additional steps.';
            },
            @{
                'Caption' = 'Connecting from both systems';
                'Command' = 'Show-IcingaForWindowsInstallerMenuSelectHostname';
                'Help'    = 'Choose this if connections from a parent Icinga node are possible and the Icinga Agent should connect to a parent node. This will open the Windows firewall for the chosen Icinga protocol port (default 5665).';
            },
            @{
                'Caption' = 'Icinga Director Self-Service API';
                'Command' = 'Show-IcingaForWindowsManagementConsoleInstallationEnterDirectorUrl';
                'Help'    = 'Choose this option if you can connect to the Icinga Director from this host. You will be asked for the Icinga Director Url and a Self-Service API key. The entire configuration for this host is then fetched from the Icinga Director.';
            }
        ) `
        -DefaultIndex $DefaultInput `
        -JumpToSummary:$JumpToSummary `
        -ConfigElement `
        -Automated:$Automated `
        -Advanced:$Advanced;
}

Set-Alias -Name 'IfW-Connection' -Value 'Show-IcingaForWindowsInstallerMenuSelectConnection';
