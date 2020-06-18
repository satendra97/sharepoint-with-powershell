Connect-SPOService -Url https://contoso-admin.sharepoint.com
$st = Get-SPOUser -Site https://contoso.sharepoint.com/sites/contoso
$objectCollection=@()  


foreach ( $sts in $st)
{#$object = New-Object PSObject 
    foreach ($tt in $sts.Groups)
        {
            $object = New-Object PSObject 
            #write-Host $sts.DisplayName,$sts.LoginName,$sts.UserType,$tt
            $object | Add-Member -type NoteProperty -Name DISPLAYNAME -Value $sts.DisplayName
            $object | Add-Member -type NoteProperty -Name LOGINNAMES  -Value $sts.LoginName  
            $object | Add-Member -type NoteProperty -Name USERTYPES -Value $sts.UserType 
            $object | Add-Member -type NoteProperty -Name GROUPS -Value $tt 
        $objectCollection += $object
         }

 }
 $objectCollection | Export-Csv C:\datafile.csv -NoTypeInformation