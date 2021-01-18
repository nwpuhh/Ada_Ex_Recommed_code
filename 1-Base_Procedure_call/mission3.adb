with Ada.Text_IO ;

procedure Mission3 is

   package Txt renames Ada.Text_IO ;

   function Affine (A, B, X : Integer) return Integer is
      Resultat : Integer ;
   begin
      Resultat := A * X + B ;
      return Resultat ;
   end Affine ;

   -- 2. correct this procedure of testing the function of affine
   procedure Tester_Affine (VA, VB, VX : Integer) is
      Resultat : Integer ;
   begin
      -- 1. before do any changes, it should be a warning and print something in random if directly execute
      --Txt.Put_Line("Resultat = " & Integer'Image(Resultat)) ;
    
        Resultat := Affine(A => VA, B => VB, X => VX);
        Txt.Put_Line("Resultat = " & Integer'Image(Resultat));
   end Tester_Affine ;

begin

   -- Corps du programme
   Tester_Affine (VA => 10, VB => 99, VX => 5) ;

end Mission3 ;