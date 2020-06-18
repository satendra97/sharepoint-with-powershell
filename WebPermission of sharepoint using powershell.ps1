
Connect-PnPOnline -Url "https://contoso.sharepoint.com/" -UseWebLogin
$web = Get-PnPWeb -Includes RoleAssignments
foreach($ra in $web.RoleAssignments) {
    $member = $ra.Member
    $loginName = get-pnpproperty -ClientObject $member -Property LoginName
    $rolebindings = get-pnpproperty -ClientObject $ra -Property RoleDefinitionBindings
 
    write-host "$($loginName) - $($rolebindings.Name)"
    write-host  
}



