with InputSanitizer;

package Input_Processor is

   procedure Process (Input : InputSanitizer.Input_Range);
   
   subtype Result_String is String(1 .. 10);
   
   function Get_Processing_Result return Result_String;

end Input_Processor;
