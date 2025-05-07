enumextension 60100 "TE PriceStrategyExt1" extends "TE PriceStrategy"
{
    value(60100; "TE Verbose Discounted Price")
    {
        Caption = 'Verbose Discounted Price';
        Implementation = "TE IPriceStrategy" = "TE Verbose Discounted Price";
    }
}
