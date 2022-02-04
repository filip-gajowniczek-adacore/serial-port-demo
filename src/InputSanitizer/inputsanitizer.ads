with Ada.Real_Time; 

package InputSanitizer is

   type Input_Range is range 0 .. 10;
   
   -- Read which blocks until specified Time_Span elapses
   function Read (Timeout : Ada.Real_Time.Time_Span; Read_Value : out Input_Range) return Boolean;

end InputSanitizer;
