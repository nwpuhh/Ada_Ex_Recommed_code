with Ada.Text_IO;

procedure Mission8 is 
    package Txt renames Ada.Text_IO;

    -- Add a new function "Secret"
    function Secret(N: Integer) return Integer is
        x, res, m, p : Integer;
        b, d : Boolean;
    begin
        x := N;
        res := 2;
        while x > 1 loop
            x := x - 1;
            b := False;

            -- The second loop
            while not b loop
                res := res + 1;
                d := False;
                m := 2;
                
                -- The third loop
                while not (d or m > (res / 2)) loop
                    p := 0;

                    -- The forth loop
                    while p < res loop
                        p := p + m;
                    end loop;

                    if p = res then
                        d := True;
                    else 
                        m := m + 1;
                    end if;    
                end loop;

                -- update the value of b
                b := not d;

            end loop;

        end loop;
        return res;
    end Secret;

    -- write the test procedure for function Secert
    procedure test_secert is
    begin
        -- do a loop to print all values returned from 1 .. 10
        for i in 1..10 loop
            Txt.Put(Integer'Image(Secret(i)));
        end loop;
    end test_secert;

begin
    test_secert;
end Mission8;