enum 60100 "TE PriceStrategy" implements "TE IPriceStrategy"
{
    Caption = 'TE Price Strategy';
    DefaultImplementation = "TE IPriceStrategy" = "TE Fixed Price";
    Extensible = true;

    value(1; "TE Fixed Price")
    {
        Caption = 'Fixed Price';
        Implementation = "TE IPriceStrategy" = "TE Fixed Price";
    }
    value(2; "TE Discounted Price")
    {
        Caption = 'Discounted Price';
        Implementation = "TE IPriceStrategy" = "TE Discounted Price";
    }
}
