Import-Module ActiveDirectory

$oldSuffix = "dominio.local"

$newSuffix = "dominio.com.br"

$OU = "DC=dominio,DC=local"

Get-ADUser -SearchBase $OU -filter * | ForEach-Object {

    $newUPN = $_.UserPrincipalName.Replace($oldSuffix, $newSuffix)

    $_ | Set-ADUser -UserPrincipalName $newUPN

}
