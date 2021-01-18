-- Description: factorial function, f(0) = 1, f(1) = 1, f(2) = 2, ..., f(n) = f(n-1) * n
with Ada.Text_IO;

procedure mission1 is
    package Txt renames Ada.Text_IO;

    -- define the factorial function
    function factorielle(X : Integer) return Integer is
        result : Integer := 1;
    begin
        if X = 0 then
            result := 1;
        else
            for i in 1 .. X loop
                result := result * i;
            end loop;
        end if;
        return result;
    end factorielle;

    -- the test function of factorial function
    procedure test_factorielle is
    begin
        for i in 0 .. 5 loop
            Txt.Put_Line("Factorielle " & Integer'Image(i) & " = " & Integer'Image(factorielle(i)));
        end loop;
        Txt.Put_Line("etc");
    end test_factorielle;

begin
    -- call the test procedure
    test_factorielle;

end mission1;