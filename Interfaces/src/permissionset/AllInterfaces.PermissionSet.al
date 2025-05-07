permissionset 60100 "TE All Interfaces"
{
    Caption = 'All Interfaces Permissions', Locked = true;
    Permissions =
        codeunit "TE Discounted Price" = X,
        codeunit "TE Fixed Price" = X,
        codeunit "TE Prices Management" = X,
        codeunit "TE Verbose Discounted Price" = X;
}
