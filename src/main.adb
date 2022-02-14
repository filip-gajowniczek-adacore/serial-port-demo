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

   Send ("Enter Input in [0,10], terminated by CR." & ASCII.CR & ASCII.LF);
   while InputSanitizer.Read( Seconds(10), Input) loop
      Send ("Enter Input in [0,10], terminated by CR." & ASCII.CR & ASCII.LF);
   end loop;

   Send( "Application Terminating. Goodbye." & ASCII.CR & ASCII.LF );
end Main;

