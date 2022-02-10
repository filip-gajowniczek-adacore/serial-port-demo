with InputSanitizer;

package Input_Processor is

   procedure Process (Input : InputSanitizer.Input_Range);
   
   type Result_String is new String(1 .. 10);
   
   function Get_Processing_Result return Result_String;

end Input_Processor;
