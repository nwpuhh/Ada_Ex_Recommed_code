-- Description: realise the procedure of piloter_tapis

with Outil_De_Mesure ;
with Tapis;

procedure Mission7 is
   
    Somme : constant Float := 340.8 ;
   
    package OM renames Outil_De_Mesure ;
   
    -- Cette fonction Dimensions_OK vérifie que la somme des mesures ne dépasse pas une certaine longueur.
    -- Ce n'est pas un corrigé du TD.
    function Dimensions_OK return Boolean is
        Resultat : Boolean ;
    begin
        Resultat := OM.Dim(1) + OM.Dim(2) + OM.Dim(3) <= Somme ;
        return Resultat ;
    end Dimensions_OK ;
   
    procedure Piloter_Tapis is
        -- Two variables
        Err : Integer;
        A_jeter : Boolean;
    begin
        Err := 0;
        while not (Tapis.Est_Vide or Err >= 5) loop
            if Tapis.Produit_Dans_Zone then 
                -- call function "Dimensions_OK"
                if Dimensions_OK then
                    A_jeter := False;
                    Err := 0;
                else
                    A_jeter := True;
                    Err := Err + 1;
                end if;
                -- do the aiguiller
                Tapis.Aiguiller_Produit(Recyclage => A_jeter);
            else
                Tapis.Avancer;
            end if;
        end loop; 
    end Piloter_Tapis ;
   
begin
    Piloter_Tapis ;
end Mission7 ;