function CompareIp {
    [CmdletBinding()]
    param (
        [parameter(Mandatory = $true, Position = 0)]
    # Validate pattern IP address for ip_address_1 parametr
        [ValidatePattern("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",
            ErrorMessage = "`nYour input '{0}' does not fit IP address format.`nPlease use x.x.x.x format (e.g. 192.168.1.1)")]
        $ip_address_1,

        [parameter(Mandatory = $true, Position = 1)]
    # Validate pattern IP address for ip_address_2 parametr
        [ValidatePattern("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",
            ErrorMessage = "`nYour input '{0}' does not fit IP address format. `nPlease use x.x.x.x format (e.g. 192.168.1.1)")]
        $ip_address_2,

        [parameter(Mandatory = $true, Position = 2)]
    # Validate 2 patterns: 1-32 digits & IP address for network_mask
        [ValidatePattern("^([1-9]|[12][0-9]|3[0-2])$|(^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$)",
            ErrorMessage = "`nYour input '{0}' does not fit IP address format. `nPlease use x.x.x.x or xx format (e.g. 255.255.255.0 or 24)")]
        $network_mask
    )   
    # Convert prefix xx to x.x.x.x subnet mask format
        if($network_mask -as [int]) {
            [ipaddress]$network_mask_int = 0
    # Use -shr (shift-right) & -shl (shift-left) to convert to binary format
            $network_mask_int.address = ([UInt32]::MaxValue) -shl (32 - $network_mask) -shr (32 - $network_mask)
            $network_mask = $network_mask_int.IPAddressToString
        }
        $network_mask_match = '0|128|192|224|240|248|252|254|255'
        if([string]$network_mask -match ` (
            ('^((({0})\.0\.0\.0)|' -f $network_mask_match) + 
            ('(255\.({0})\.0\.0)|' -f $network_mask_match) + 
            ('(255\.255\.({0})\.0)|' -f $network_mask_match +
            ('(255\.255\.255\.({0})))$' -f $network_mask_match)))) {
# Compare ip with  bitwise operations like -band 
                if ((([ipaddress]$ip_address_1).address -band ([ipaddress]$network_mask).address) -eq (([ipaddress]$ip_address_2).address -band ([ipaddress]$network_mask).address)) {
                    Write-Output "yes"
                }
                else {
                    Write-Output "no"
                } 
                }
        else {
            Write-Output "Network_mask parametr '$network_mask' does not fit network mask format. `nPlease use x.x.x.x or xx format (e.g. 255.255.255.0 or 24)"
        }
} CompareIp