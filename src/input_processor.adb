pragma Ada_2012;
with Ada.Exceptions;  use Ada.Exceptions;

package body Input_Processor is

   Accumulation : Natural := 0;

   -------------
   -- Process --
   -------------

   procedure Process (Input : InputSanitizer.Input_Range) is
   begin
      if Natural'Last - Accumulation >= Natural(Input) then
         Accumulation := Accumulation + Natural(Input);
      else
         Accumulation := Natural'Last;
      end if;
   end Process;

   ---------------------------
   -- Get_Processing_Result --
   ---------------------------

   -- Returns fixed-length String on the secondary stack
   function Get_Processing_Result return String is
   begin
      return Accumulation'Image;
   end Get_Processing_Result;

end Input_Processor;
