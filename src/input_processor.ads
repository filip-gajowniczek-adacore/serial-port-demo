with InputSanitizer;

package Input_Processor is

   procedure Process (Input : InputSanitizer.Input_Range);
   
   function Get_Processing_Result return String;

end Input_Processor;
