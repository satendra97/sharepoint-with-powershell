#Connect-PnPOnline -Url "https://contoso.sharepoint.com/sites/demosite" -UseWebLogin
$web = Get-PnPSubWebs -Includes RoleAssignments
$objectcollection = @()
foreach($ra in $web.RoleAssignments) {
    $member = $ra.Member
    $loginName = get-pnpproperty -ClientObject $member -Property LoginName
    $rolebindings = get-pnpproperty -ClientObject $ra -Property RoleDefinitionBindings
   foreach( $tt in  $rolebindings.Name)
    {
    $object = New-Object PSObject
    $object | Add-Member -type NoteProperty -Name GROUPS -Value $($loginName) 
    
    $object | Add-Member -type NoteProperty -Name PERMISSIONS -Value $tt
        $objectCollection += $object
    
   
     
    }
}
 $objectCollection | Export-Csv C:\permissionfile.csv -NoTypeInformation