with Ada.Text_IO ;

procedure Mission2 is

   package Txt renames Ada.Text_IO ;

   -- 2. add the parameter "Prix"
   function Calcul (Prix: Integer) return Integer is
      -- 1. It always returns 0 cause the Results is set => need be changed
      -- Wrong! Resultat := 0 ;
      Resultat : Integer;
   begin
      --Resultat := 99;
      if Prix < 0 then
         Resultat := 0;
      else 
         Resultat := 2 * Prix;
      end if;

      return Resultat ;
   end Calcul ;

   procedure test_Calcul is
   begin
      Txt.Put_Line("Test function for Calcul:");
      -- Two test case for function Calcul
      Txt.Put_Line(Integer'Image(Calcul(-5)));
      Txt.Put_Line(Integer'Image(Calcul(10)));
   end test_Calcul;

   -- 3. add the second function "Somme"
   --function Somme(U: Integer; V: Integer) return Integer is
   function Somme(U, V: Integer) return Integer is             -- It is equal write the parameter like that
      Resultat : Integer;
   begin 
      Resultat := Calcul(Prix => U) + Calcul(Prix => V);
      return Resultat;
   end Somme;

   procedure test_Somme is
   begin
      -- Two test cases for function Somme
      Txt.Put_Line("Test function for Somme:");
      Txt.Put_Line(Integer'Image(Somme(U => -10, V => 5))); -- should be 10
      Txt.Put_Line(Integer'Image(Somme(-4, -2))); -- should be 0
      Txt.Put_Line(Integer'Image(Somme(8, 2)));   -- should be 20

   end test_Somme;

   Y : Integer ;
   V : Integer ;
   
begin

   -- Corps du programme
   Y := 10 ;

   --1. print the value return back from the function
   --Txt.Put_Line(Integer'Image(Calcul));

   -- 2. print the return value of function by giving variable Y
   Txt.Put_Line(Integer'Image(Calcul(Prix => Y)));

   -- add the part of printing the test of Calaul function
   test_Calcul;

   -- add the part of printing the test of Somme function
   test_Somme;

   -- 4. print the Somme of 20 and -8
   Y := 20;
   V := -8;
   Txt.Put_Line("The two values are " & Integer'Image(Y) & " and " & Integer'Image(V) & ", the result of Somme is " & Integer'Image(Somme(Y, V)));

end Mission2 ;