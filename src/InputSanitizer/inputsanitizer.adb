pragma Ada_2012;
package body InputSanitizer is

   ----------
   -- Read --
   ----------

   function Read
     (Timeout : Ada.Real_Time.Time_Span; Read_Value : out Input_Range)
      return Boolean
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Read unimplemented");
      return raise Program_Error with "Unimplemented function Read";
   end Read;

end InputSanitizer;
