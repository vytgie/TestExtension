codeunit 60101 "TE Discounted Price" implements "TE IPriceStrategy"
{
    procedure GetPrice(BasePrice: Decimal): Decimal
    begin
        exit(BasePrice * 0.9);
    end;
}
