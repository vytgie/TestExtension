pageextension 60100 "TE DEV Page Ext." extends "TE DEV Page"
{
    layout
    {
        addlast(General)
        {
            group("TE Interfaces")
            {
                Caption = 'Interfaces';
                Visible = true;

                field("TE Price Strategy"; PriceStrategy)
                {
                    ApplicationArea = All;
                    Caption = 'Price Strategy';
                    ToolTip = 'Specifies the price strategy for the item.';
                }
                field("TE Base Price"; BasePrice)
                {
                    ApplicationArea = All;
                    Caption = 'Base Price';
                    ToolTip = 'Specifies Base Price for the item.';
                }
            }
        }
    }

    actions
    {
        addlast(Promoted)
        {
            group("TE InterfacesActionsPromoted")
            {
                Caption = 'Interfaces';
                Visible = true;

                actionref("TE Example1ActionRef"; "TE Example 1 Action") { }
                actionref("TE Example2ActionRef"; "TE Example 2 Action") { }
                actionref("TE Example3ActionRef"; "TE Example 3 Action") { }
                actionref("TE Example4ActionRef"; "TE Example 4 Action") { }
            }
        }
        addlast(Processing)
        {
            group("TE InterfacesActions")
            {
                Caption = 'Interfaces';
                action("TE Example 1 Action")
                {
                    ApplicationArea = All;
                    Caption = 'Simple Interface';
                    ToolTip = 'Shows example of simple interface usage.';
                    Image = "8ball";

                    trigger OnAction()
                    var
                        IPriceStrategy: Interface "TE IPriceStrategy";
                    begin
                        IPriceStrategy := PriceStrategy;
                        Message('The price is: %1', IPriceStrategy.GetPrice(BasePrice));
                    end;
                }

                action("TE Example 2 Action")
                {
                    ApplicationArea = All;
                    Caption = 'Extended Interface';
                    ToolTip = 'Shows example of extended interface usage.';
                    Image = "8ball";

                    trigger OnAction()
                    var
                        VerboseDiscountedPrice: Codeunit "TE Verbose Discounted Price";
                        IPriceStrategy: Interface "TE IDescribablePriceStrategy";
                    begin
                        IPriceStrategy := VerboseDiscountedPrice;
                        Message('%1', IPriceStrategy.GetDescription());
                    end;
                }
                action("TE Example 3 Action")
                {
                    ApplicationArea = All;
                    Caption = 'Interface Casting';
                    ToolTip = 'Shows example of interface casting.';
                    Image = "8ball";

                    trigger OnAction()
                    var
                        IPriceStrategy: Interface "TE IPriceStrategy";
                    begin
                        IPriceStrategy := PriceStrategy;

                        if IPriceStrategy is "TE IDescribablePriceStrategy" then
                            Message('The price is: %1\%2', IPriceStrategy.GetPrice(BasePrice), (IPriceStrategy as "TE IDescribablePriceStrategy").GetDescription())
                        else
                            Message('The price is: %1', IPriceStrategy.GetPrice(BasePrice));
                    end;
                }
                action("TE Example 4 Action")
                {
                    ApplicationArea = All;
                    Caption = 'Interfaces List';
                    ToolTip = 'Shows example of interfaces list usage.';
                    Image = "8ball";

                    trigger OnAction()
                    var
                        PricesManagement: Codeunit "TE Prices Management";
                        StrategiesList: List of [Interface "TE IPriceStrategy"];
                        Strategy: Interface "TE IPriceStrategy";
                        AvailablePrices: Text;
                    begin
                        StrategiesList := PricesManagement.GetPriceInterfacesList();
                        foreach Strategy in StrategiesList do
                            AvailablePrices += StrSubstNo('%1; ', Strategy.GetPrice(BasePrice));

                        Message('The available prices are: %1', AvailablePrices);
                    end;
                }
                action("TE Example 5 Action")
                {
                    ApplicationArea = All;
                    Caption = 'Interfaces Dictionary';
                    ToolTip = 'Shows example of interfaces dictionary usage.';
                    Image = "8ball";

                    trigger OnAction()
                    var
                        PricesManagement: Codeunit "TE Prices Management";
#pragma warning disable LC0003
#pragma warning disable LC0005
                        StrategiesDictionary: Dictionary of [Integer, Interface "TE IPriceStrategy"];
#pragma warning restore LC0005
#pragma warning restore LC0003
                        Strategy: Interface "TE IPriceStrategy";
                        dKey: Integer;
                        AvailablePrices: Text;
                    begin
                        StrategiesDictionary := PricesManagement.GetPriceInterfacesDictionary();
                        foreach dKey in StrategiesDictionary.Keys do begin
                            Strategy := StrategiesDictionary.Get(dKey);
                            if Strategy is "TE IDescribablePriceStrategy" then
                                AvailablePrices += StrSubstNo('%1 (%2); ', Strategy.GetPrice(BasePrice), (Strategy as "TE IDescribablePriceStrategy").GetDescription())
                            else
                                AvailablePrices += StrSubstNo('%1; ', Strategy.GetPrice(BasePrice));
                        end;

                        Message('The available prices are: %1', AvailablePrices);
                    end;
                }
            }
        }
    }

    var
        BasePrice: Decimal;
        PriceStrategy: Enum "TE PriceStrategy";
}
