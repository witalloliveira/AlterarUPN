#####################################################################################################
#                                                                                                   #
#     Cloud2Go · Soluções em Nuvem | NGX · Next Generation IT | GRUPO NGX · www.cloud2go.com.br     #
# Witallo da Silva Oliveira (@witalloliveira) · Cloud Infrastructure Analyst · Criado em 04/06/2018 #
#  Script para alterar o UPN de todos os usuários em um domínio  · Última modificação em 04/06/2018 #
#                                                                                                   #
#####################################################################################################

Import-Module ActiveDirectory

$oldSuffix = "dominio.local"

$newSuffix = "dominio.com.br"

$OU = "DC=dominio,DC=local"

Get-ADUser -SearchBase $OU -filter * | ForEach-Object {

    $newUPN = $_.UserPrincipalName.Replace($oldSuffix, $newSuffix)

    $_ | Set-ADUser -UserPrincipalName $newUPN

}