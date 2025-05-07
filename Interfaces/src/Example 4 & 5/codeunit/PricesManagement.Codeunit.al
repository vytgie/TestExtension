codeunit 60103 "TE Prices Management"
{
    procedure GetPriceInterfacesList(): List of [Interface "TE IPriceStrategy"]
    var
        FixedPrice: Codeunit "TE Fixed Price";
        DiscountedPrice: Codeunit "TE Discounted Price";
        VerboseDiscountedPrice: Codeunit "TE Verbose Discounted Price";
        PriceStrategy: List of [Interface "TE IPriceStrategy"];
    begin
        PriceStrategy.Add(FixedPrice);
        PriceStrategy.Add(DiscountedPrice);
        PriceStrategy.Add(VerboseDiscountedPrice);

        OnAfterAddImplementationsToInterfaceList(PriceStrategy);

        exit(PriceStrategy);
    end;

    procedure GetPriceInterfacesDictionary(): Dictionary of [Integer, Interface "TE IPriceStrategy"]
    var
        FixedPrice: Codeunit "TE Fixed Price";
        DiscountedPrice: Codeunit "TE Discounted Price";
        VerboseDiscountedPrice: Codeunit "TE Verbose Discounted Price";
#pragma warning disable LC0003
#pragma warning disable LC0005
        PriceStrategy: Dictionary of [Integer, Interface "TE IPriceStrategy"];
#pragma warning restore LC0005
#pragma warning restore LC0003
    begin
        PriceStrategy.Add(1, FixedPrice);
        PriceStrategy.Add(2, DiscountedPrice);
        PriceStrategy.Add(3, VerboseDiscountedPrice);

        OnAfterAddImplementationsToInterfaceDictionary(PriceStrategy);

        exit(PriceStrategy);
    end;



    [BusinessEvent(false, false)]
    local procedure OnAfterAddImplementationsToInterfaceList(var PriceStrategy: List of [Interface "TE IPriceStrategy"])
    begin
    end;

    [BusinessEvent(false, false)]
    local procedure OnAfterAddImplementationsToInterfaceDictionary(var PriceStrategy: Dictionary of [Integer, Interface "TE IPriceStrategy"])
    begin
    end;
}
