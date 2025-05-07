codeunit 60100 "TE Fixed Price" implements "TE IPriceStrategy"
{
    procedure GetPrice(BasePrice: Decimal): Decimal
    begin
        exit(BasePrice);
    end;
}
