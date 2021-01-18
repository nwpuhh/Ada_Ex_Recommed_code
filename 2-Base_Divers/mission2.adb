-- Description: The function of sum of integers from 1 to N
with Ada.Text_IO;

procedure Mission2 is
    package Txt renames Ada.Text_IO;

    -- The function itself => not use the Gaussi formula, using the loop
    function Somme_n (N: Integer) return Integer is
        sum : Integer := 0;
    begin
        -- better do the judgement of N is positive
        if N <= 0 then
            Txt.Put_Line("Wrong!! N must be positive");
        else
            -- do the loop
            for i in 1 .. N loop
                sum := sum + i;
            end loop;
        end if;

        return sum;
    end Somme_n;

    -- test procedure of the sum function
    procedure test_somme_n is
        n : Integer;
    begin
        n := 100;
        Txt.Put_Line("The sum from 1 to " & Integer'Image(n) & " is " & Integer'Image(Somme_n(N => n)));

        n := 1000;
        Txt.Put_Line("The sum from 1 to " & Integer'Image(n) & " is " & Integer'Image(Somme_n(N => n)));
    end test_somme_n;

begin
    -- call the test function directly
    test_somme_n;
end Mission2;