--  A demonstration of a higher-level USART interface, using non-blocking I/O.
--  The file declares the main procedure for the demonstration.

--  with Last_Chance_Handler;  pragma Unreferenced (Last_Chance_Handler);
--  The "last chance handler" is the user-defined routine that is called when
--  an exception is propagated. We need it in the executable, therefore it
--  must be somewhere in the closure of the context clauses.

with Peripherals_Nonblocking;    use Peripherals_Nonblocking;
with Serial_IO.Nonblocking;      use Serial_IO.Nonblocking;
with Message_Buffers;            use Message_Buffers;

procedure Main is

   Incoming : aliased Message (Physical_Size => 1024);  -- arbitrary size

   procedure Send (This : String);

   procedure Send (This : String) is
      Outgoing : aliased Message (Physical_Size => 1024);  -- arbitrary size
   begin
      Set (Outgoing, To => This);
      Put (COM, Outgoing'Unchecked_Access);
      Await_Transmission_Complete (Outgoing);
      --  We must await xmit completion because Put does not wait
   end Send;

begin
   Initialize (COM);

   Configure (COM, Baud_Rate => 115_200);

   Send ("Enter text, terminated by CR.");

   Set_Terminator (Incoming, To => ASCII.CR);
   loop
      Get (COM, Incoming'Unchecked_Access);
      Await_Reception_Complete (Incoming);
      --  We must await reception completion because Get does not wait

      Send ("Received : " & Content (Incoming));
   end loop;
end Main;

