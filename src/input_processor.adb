pragma Ada_2012;
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

   function Get_Processing_Result return Result_String is
   begin
      return Result_String(Accumulation'Image);
   end Get_Processing_Result;

end Input_Processor;
