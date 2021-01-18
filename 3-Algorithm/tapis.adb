-- Envoyer a mastripp@etud.insa-toulouse.fr
with Ada.Numerics.Float_Random,Ada.Text_io;
use Ada.Numerics.Float_Random,Ada.Text_io;

package body Tapis is
   
   package Txt renames ada.Text_IO ;
   
   -- Erreurs de gestion du tapis
   ERREUR_ZONE_PLEINE : exception; -- erreur quand on demande au tapis d'avancer alors que la zone de mesure est pleine
   ERREUR_ZONE_VIDE : exception; -- erreur quand on demande d'aiguiller un produit si la zone est vide


   -- ProbabilitÃ© d'avoir un nouveau produit sur le tapis
   Proba_Nouveau : constant Float := 0.25;

   -- generateur alÃ©atoire de nombres entre 0.0 et 1.0
   Gen : Generator;

   -- Taille du tapis en nombre de produits
   Taille_Tapis : constant Integer := 20;
   
   -- Nombre de pas
   Steps: Integer := 0 ;
   
   -- Au delÃ  de ce nombre d'Ã©tapes, le tapis se vide.
   Steps_Max : constant Integer := 4 ;
   
   -- Type tableau reprÃ©sentant le tapis
   -- une case vrai contient un produit
   -- une case fausse n'en contient aucun
   -- la case 0 est la zone de mesure
   type T_Tab_Tapis is array (Integer Range 0..Taille_Tapis) of Boolean;

   -- Le tapis
   Le_Tapis : T_Tab_Tapis := (others => False);
   
      -- Affiche l'Ã©tat actuel du tapis
   procedure Afficher is
   begin
      Put("<<  [") ;
      for Position in Le_Tapis'range loop
         if Le_Tapis(Position) then
            Put ("@");
         else
            Put(".");
         end if;
      end loop;
      Put("]") ;
      
      New_Line;
   end Afficher;

   
   
   -- Faire avancer le tapis
   procedure Avancer is
   begin
      
      Steps := Steps + 1 ;
      
      delay 0.25 ;
      Txt.Put_Line("[Avancer tapis]") ;
      
      -- On ne peut faire avancer le tapis tant qu'on Ã  pas vidÃ© la zone
      if Produit_Dans_Zone then
         raise ERREUR_ZONE_PLEINE;
      end if;

      -- On dÃ©place tout les produits vers le dÃ©but
      for Position in Le_Tapis'First..Le_Tapis'Last-1 loop
         Le_Tapis(Position) := Le_Tapis(Position+1) ;
      end loop;

      -- Generation alÃ©atoire de nouveaux produits
      Le_Tapis(Le_Tapis'Last) := Steps <= Steps_Max and Random(Gen) <= Proba_Nouveau ;
      
      Afficher ;
   end Avancer;

   -- Renvoie vrai si un produit est dans la zone de mesure
   function Produit_Dans_Zone return Boolean is
   begin
      delay 0.5 ;
      return Le_Tapis(0);
   end Produit_Dans_Zone;
   
   -- dirige le produit (de la zone de mesure) vers la sortie normale si Produit_accepte est vrai
   -- ou vers le recyclage sinon
   procedure Aiguiller_Produit (Recyclage : Boolean) is
   begin
      if not Produit_Dans_Zone then
         raise ERREUR_ZONE_VIDE;
      end if;
      
      if Recyclage then
	 Txt.Put_Line("Produit vers le recyclage.") ;
      else
	 Txt.Put_Line("Produit vers la sortie normale.") ;
      end if ;
      
      Le_Tapis(0):=False;
   end Aiguiller_Produit;
   

   -- Renvoie vrai s'il ne reste aucun produit sur le tapis, faux sinon
   function Est_Vide return Boolean is
      Vide : Boolean := true;
   begin
      delay 0.5 ;
      
      -- recherche d'une Ã©lÃ©ment non vide dans le tableau
      for Position in Le_Tapis'Range loop
         if Le_Tapis(Position) then
            Vide := False;
         end if;
      end loop;
      
      Afficher ;
      
      return Vide;
   end Est_Vide;

begin
   -- initialisation du gÃ©nÃ©rateur alÃ©atoire
   Reset(Gen);

   -- Generation alÃ©atoire des produits sur le tapis
   for Position in Le_Tapis'range loop
      Le_Tapis(Position):=Random(Gen)<=Proba_Nouveau;
   end loop;
   
   Steps := 0 ;

end Tapis;