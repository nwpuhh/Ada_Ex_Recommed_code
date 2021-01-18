-- Description: the first simple algorithm, do the loop of judging the tapis is empty or not
with Ada.Text_IO;
with Tapis;

procedure Mission6 is

begin
    while(not Tapis.Est_Vide) loop
    
        while(not Tapis.Produit_Dans_Zone) loop
            -- do the avancer in this loop
            Tapis.Avancer;
        end loop;

        -- do the aiguiller after the second loop ends
        Tapis.Aiguiller_Produit(Recyclage => False);
    end loop;

end Mission6;