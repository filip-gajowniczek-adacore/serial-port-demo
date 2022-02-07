--  The file declares the main procedure for the demonstration.

with Peripherals_Nonblocking;    use Peripherals_Nonblocking;
with Serial_IO.Nonblocking;      use Serial_IO.Nonblocking;
with Message_Buffers;            use Message_Buffers;
with InputSanitizer;
with Ada.Real_Time;              use Ada.Real_Time;

procedure Main is

   procedure Send (This : String);

   procedure Send (This : String) is
      Outgoing : aliased Message (Physical_Size => 1024);  -- arbitrary size
   begin
      Set (Outgoing, To => This);
      Put (COM, Outgoing'Unchecked_Access);
      Await_Transmission_Complete (Outgoing);
      --  We must await xmit completion because Put does not wait
   end Send;

   Input : InputSanitizer.Input_Range;

begin
   Initialize (COM);

   Configure (COM, Baud_Rate => 115_200);

   Send ("Enter text, terminated by CR.");

   while InputSanitizer.Read( Seconds(3), Input) loop
      Send ("Received : " & Input'Image & ASCII.CR);
   end loop;

   Send( "Application Terminating. Goodbye." );
end Main;

