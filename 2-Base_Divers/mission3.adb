-- Description: read integers (using 0 as the end of input), print the max, min, and average value
-- check page 31 in the tutorial, clarify the difference of the package used for inputing integer in Ada.
-- for using GAda.Integer_Text_IO, check the function "FGet"
with Ada.Text_IO; 
with Ada.Integer_Text_IO;

procedure Mission3 is 

    package Int_Txt renames Ada.Integer_Text_IO;
    package Txt renames Ada.Text_IO;

    -- 1. write a procedure that input one integer, and print it
    procedure Read_print is 
        N : Integer := 0;
    begin
        Int_Txt.Get(N);
        Txt.Put_Line("The value got from keyboard is " & Integer'Image(N));
    end Read_print;

    -- 2. do the loop of waiting more input until the input value is 0 =>
    -- 3. find and print the min max and average
    procedure Calculate_Values is
        min : Integer := Integer'Last;    -- Set the initial min value as the largest value of integer
        max : Integer := Integer'First;   -- initial max value as the smallest 
        n   : Integer := 1;               -- we should consider an initial value that not tigger the quit
        sum : Integer := 0;
        cnt : Integer := 0;               -- how many integers are read
    begin
        Txt.Put_Line("Hello, enter the integers, end the input by entering 0");

        while(n /= 0) loop
            Txt.Put("Your integer is ");
            Int_Txt.Get(n);

            -- judge the max min and average
            if (n /= 0) then
                -- useful input
                sum := sum + n;
                cnt := cnt + 1;

                if (n > max) then
                    max := n;
                end if;

                if (n < min) then
                    min := n;
                end if;
            end if;
        end loop;

        -- print the values
        Txt.New_Line;
        Txt.Put_Line("The average value is " & Float'Image(Float(sum) / Float(cnt)));  -- Take care of the Float transformation, or 3/2 = 1
        Txt.Put_Line("The max value is " & Integer'Image(max));
        Txt.Put_Line("The min value is " & Integer'Image(min));

    end Calculate_Values;

begin
    -- 1. test the Read_print function at first
    Read_print;

    -- 2 & 3, call Calculate_values
    Calculate_Values;

end Mission3;
