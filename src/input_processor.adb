pragma Ada_2012;
with Ada.Exceptions;  use Ada.Exceptions;

package body Input_Processor is

   Accumulation : Integer := 0;

   -------------
   -- Process --
   -------------

   procedure Process (Input : InputSanitizer.Input_Range) is
   begin
      Accumulation := Accumulation + Integer (Input);
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
