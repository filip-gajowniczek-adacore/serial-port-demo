pragma Ada_2012;
package body Input_Processor is

   -------------
   -- Process --
   -------------

   procedure Process (Input : InputSanitizer.Input_Range) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Process unimplemented");
      raise Program_Error with "Unimplemented procedure Process";
   end Process;

   ---------------------------
   -- Get_Processing_Result --
   ---------------------------

   function Get_Processing_Result return Result_String is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Processing_Result unimplemented");
      return
        raise Program_Error
          with "Unimplemented function Get_Processing_Result";
   end Get_Processing_Result;

end Input_Processor;
