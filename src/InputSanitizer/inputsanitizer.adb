PRAGMA Ada_2012;

WITH Message_Buffers;         USE Message_Buffers;
WITH Serial_IO.Nonblocking;   USE Serial_IO.Nonblocking;
WITH Peripherals_Nonblocking; USE Peripherals_Nonblocking;
WITH Ada.Real_Time;           USE Ada.Real_Time;

PACKAGE BODY InputSanitizer IS

   Incoming : ALIASED Message (Physical_Size => 2);  -- arbitrary size

   FUNCTION Sanitize
     (Raw_Message : Message; Read_Value : OUT Input_Range) RETURN Boolean
   IS
   BEGIN
      IF Raw_Message.Content(1) = '1'
        AND THEN Raw_Message.Content(2) = '0'
      THEN
         Read_Value := 10;
      ELSIF Raw_Message.Content(2) IN '0' .. '9' THEN
         Read_Value := Input_Range'Value (Raw_Message.Content);
      ELSE
         RETURN False;
      END IF;
      RETURN True;
   END Sanitize;

   ----------
   -- Read --
   ----------

   FUNCTION Read
     (Timeout : Ada.Real_Time.Time_Span; Read_Value : OUT Input_Range)
      RETURN Boolean
   IS
   BEGIN

      Get (COM, Incoming'Unchecked_Access);

      DELAY UNTIL Ada.Real_Time.Clock + Timeout;

      IF COM.Receiving THEN
         -- Serial port is still waiting to receive data after timeout
         RETURN False;
      ELSIF Sanitize (Incoming, Read_Value) THEN
         RETURN True;
      ELSE
         RETURN False;
      END IF;

   END Read;

BEGIN
   Set_Terminator (Incoming, To => ASCII.CR);
END InputSanitizer;
