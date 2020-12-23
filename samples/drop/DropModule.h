/*****************************************************************************

      DropModule.h
      Copyright (c) 2020 Raphael DINGE

*Tab=3***********************************************************************/



/*\\\ INCLUDE FILES \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

#include "DropDsp.h"

#include "erb/erb.h"



/*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

using namespace erb;

struct DropModule
{
   DropDsp drop_dsp { sample_rate };

   Module module;

   AudioInDaisy audio_in_left { module, AudioInDaisyPinLeft };
   AudioInDaisy audio_in_right { module, AudioInDaisyPinRight };

   AudioOutDaisy audio_out_left { module, AudioOutDaisyPinLeft };
   AudioOutDaisy audio_out_right { module, AudioOutDaisyPinRight };

   GateIn sync_gate { module, Pin14 };
   Led sync_led { module, Pin13 };
   Switch mute_hp { module, Pin12, Pin11 };
   Pot freq { module, AdcPin0 };
   Button arm_button { module, Pin10 };
   GateIn arm_gate { module, Pin9 };
   Led arm_led { module, Pin8 };
   LedBi state_led { module, Pin7, Pin6 };

   DropDsp::State _old_state = DropDsp::State::None;

   void  process ();
};
