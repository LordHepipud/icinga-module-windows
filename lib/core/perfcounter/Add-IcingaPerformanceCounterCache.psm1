<#
.SYNOPSIS
   Adds counter instances or single counter objects to an internal cache
   by a given counter name or full path
.DESCRIPTION
   Adds counter instances or single counter objects to an internal cache
   by a given counter name or full path
.FUNCTIONALITY
   Adds counter instances or single counter objects to an internal cache
   by a given counter name or full path
.EXAMPLE
   PS>Add-IcingaPerformanceCounterCache -Counter '\Processor(*)\% processor time' -Instances $CounterInstances;
.PARAMETER Counter
   The path to the counter to store data for
.PARAMETER Instances
   The value to store for a specific path to a counter
.INPUTS
   System.String
.LINK
   https://github.com/Icinga/icinga-powershell-framework
#>

function Add-IcingaPerformanceCounterCache()
{
    param (
        $Counter,
        $Instances
    );

    if ($global:Icinga_PerfCounterCache.ContainsKey($Counter)) {
        $global:Icinga_PerfCounterCache[$Counter] = $Instances;
    } else {
        $global:Icinga_PerfCounterCache.Add(
            $Counter, $Instances
        );
    }
}
