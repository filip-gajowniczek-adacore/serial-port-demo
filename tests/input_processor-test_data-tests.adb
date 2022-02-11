--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Input_Processor.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;

--  begin read only
--  id:2.2/00/
--
--  This section can be used to add with clauses if necessary.
--
--  end read only

--  begin read only
--  end read only
package body Input_Processor.Test_Data.Tests is

--  begin read only
--  id:2.2/01/
--
--  This section can be used to add global variables and other elements.
--
--  end read only

--  begin read only
--  end read only

--  begin read only
   procedure Test_Process (Gnattest_T : in out Test);
   procedure Test_Process_c92564 (Gnattest_T : in out Test) renames Test_Process;
--  id:2.2/c9256439173dc9e7/Process/1/0/
   procedure Test_Process (Gnattest_T : in out Test) is
   --  input_processor.ads:5:4:Process
--  end read only

      use InputSanitizer;

   begin

      -- Call subprogram under test
      Input_Processor.Process(Gnattest_T.Input_1);

      AUnit.Assertions.Assert
        ( Input_Range'Value(Input_Processor.Get_Processing_Result) = 5,
         "Input_Processor package improperly initialized");

      Input_Processor.Process(Gnattest_T.Input_2);

      AUnit.Assertions.Assert
        ( Input_Range'Value(Input_Processor.Get_Processing_Result) = 7,
          "Input_Processor improperly processes input");

--  begin read only
   end Test_Process;
--  end read only


--  begin read only
   procedure Test_Get_Processing_Result (Gnattest_T : in out Test);
   procedure Test_Get_Processing_Result_23e640 (Gnattest_T : in out Test) renames Test_Get_Processing_Result;
--  id:2.2/23e640d50ac39484/Get_Processing_Result/1/0/
   procedure Test_Get_Processing_Result (Gnattest_T : in out Test) is
   --  input_processor.ads:7:4:Get_Processing_Result
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Get_Processing_Result;
--  end read only

--  begin read only
--  id:2.2/02/
--
--  This section can be used to add elaboration code for the global state.
--
begin
--  end read only
   null;
--  begin read only
--  end read only
end Input_Processor.Test_Data.Tests;
