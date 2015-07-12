--------------------------------------------------------------------------------------------------------------------
--  Copyright (c) 2014 Luke A. Guest
--
--  This software is provided 'as-is', without any express or implied
--  warranty. In no event will the authors be held liable for any damages
--  arising from the use of this software.
--
--  Permission is granted to anyone to use this software for any purpose,
--  including commercial applications, and to alter it and redistribute it
--  freely, subject to the following restrictions:
--
--     1. The origin of this software must not be misrepresented; you must not
--     claim that you wrote the original software. If you use this software
--     in a product, an acknowledgment in the product documentation would be
--     appreciated but is not required.
--
--     2. Altered source versions must be plainly marked as such, and must not be
--     misrepresented as being the original software.
--
--     3. This notice may not be removed or altered from any source
--     distribution.
--------------------------------------------------------------------------------------------------------------------
--  SDL.Events.Events
--
--  Combines all of the various event types into a single variant record to match the union in the SDL library. Not
--  the nicest of names for the package, but it works.
with SDL.Events.Windows;
with SDL.Events.Keyboards;
with SDL.Events.Joysticks;
with SDL.Events.Controllers;

package SDL.Events.Events is
   type Event_Selector is (Is_Event,
                           Is_Window_Event,
                           Is_Keyboard_Event,
                           Is_Controller_Event,
                           Is_Joystick_Axis_Event,
                           Is_Joystick_Ball_Event,
                           Is_Joystick_Hat_Event,
                           Is_Joystick_Device_Event);

   type Events (Event_Type : Event_Selector := Is_Event) is
      record
         case Event_Type is
            when Is_Window_Event =>
               Window          : SDL.Events.Windows.Window_Events;

            when Is_Keyboard_Event =>
               Keyboard        : SDL.Events.Keyboards.Keyboard_Events;

            when Is_Joystick_Axis_Event =>
               Joystick_Axis   : SDL.Events.Joysticks.Axis_Events;

            when Is_Joystick_Ball_Event =>
               Joystick_Ball   : SDL.Events.Joysticks.Ball_Events;

            when Is_Joystick_Hat_Event =>
               Joystick_Hat    : SDL.Events.Joysticks.Hat_Events;

            when Is_Joystick_Device_Event =>
               Joystick_Device : SDL.Events.Joysticks.Device_Events;

            when Is_Controller_Event =>
               Constroller     : SDL.Events.Controllers.Controller_Events;

            when others =>
               Common          : Common_Events;
         end case;
      end record with
     Unchecked_Union,
     Convention => C;

   function Poll (Event : out Events) return Boolean;
end SDL.Events.Events;