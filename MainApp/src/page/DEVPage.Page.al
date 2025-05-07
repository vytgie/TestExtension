page 60000 "TE DEV Page"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'DEV Page';
    PageType = Card;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

            }
        }
    }

    actions
    {
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Generate GUID Ref"; "Generate GUID") { }
            }
        }
        area(Processing)
        {
            action("Generate GUID")
            {
                Caption = 'Generate GUID';
                ToolTip = 'Generated new GUID value.';
                Image = Create;

                trigger OnAction()
                begin
                    Message(CreateGuid().ToText().ToLower());
                end;
            }


        }
    }
}
