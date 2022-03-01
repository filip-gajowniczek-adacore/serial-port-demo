pragma Ada_2012;

with Message_Buffers;            use Message_Buffers;
with Serial_IO.Nonblocking;      use Serial_IO.Nonblocking;
with Peripherals_Nonblocking;    use Peripherals_Nonblocking;
with Ada.Real_Time;              use Ada.Real_Time;

package body InputSanitizer is

   Incoming : aliased Message (Physical_Size => 2);  -- arbitrary size

   function Sanitize( Raw_Message : Message; Read_Value : out Input_Range ) return Boolean is
   begin
      if Raw_Message.Content(1) = '1' and then Raw_Message.Content(2) = '0' then
         Read_Value := 10;
      elsif Raw_Message.Content(2) in '0' .. '9' then
         Read_Value := Input_Range'Value(Raw_Message.Content);
      else
         return False;
      end if;
      return True;
   end Sanitize;

   ----------
   -- Read --
   ----------

   function Read
     (Timeout : Ada.Real_Time.Time_Span; Read_Value : out Input_Range)
      return Boolean
   is
   begin

      Get (COM, Incoming'Unchecked_Access);

      delay until Ada.Real_Time.Clock + Timeout;

      if COM.Receiving then
         -- Serial port is still waiting to receive data after timeout
         return False;
      elsif Sanitize(Incoming, Read_Value) then
         return True;
      else
         return False;
      end if;

   end Read;

begin
   Set_Terminator (Incoming, To => ASCII.CR);
end InputSanitizer;
