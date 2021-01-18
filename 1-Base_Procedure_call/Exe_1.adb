with Ada.Text_IO;

procedure Exe_1 is

    package Txt renames Ada.Text_IO;

    procedure Afficher(Arg: Integer) is
    begin
        -- Finish codes here: print the integer in the procedure
        Txt.Put_Line(Integer'Image(Arg));
    end Afficher;

    X : Integer;

begin
    X := 10;

    -- Finish code here: call the Afficher procedure
    Afficher(Arg => X);

    -- How to print the value of X^2 - 12X without changing the procedure of Afficher
    Afficher(Arg => X*X - 12*X);
end Exe_1;