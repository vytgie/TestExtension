codeunit 60102 "TE Verbose Discounted Price" implements "TE IDescribablePriceStrategy"
{
    procedure GetPrice(BasePrice: Decimal): Decimal
    begin
        exit(BasePrice * 0.8);
    end;

    procedure GetDescription(): Text
    begin
        exit('20% off sale price');
    end;
}
