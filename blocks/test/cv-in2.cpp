/*****************************************************************************

      main.cpp
      Copyright (c) 2020 Raphael DINGE

*Tab=3***********************************************************************/



/*\\\ INCLUDE FILES \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

#include "erb/erb.h"



/*\\\ FUNCTIONS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

/*
==============================================================================
Name : main
==============================================================================
*/

int main ()
{
   using namespace erb;

   Module module;
   AudioOutDaisy audio_out_left (module, AudioOutDaisyPinLeft);
   AudioOutDaisy audio_out_right (module, AudioOutDaisyPinRight);

   CvIn ctrl (module, AdcPin0);

   module.run ([&](){
      for (size_t i = 0 ; i < audio_out_left.size () ; ++i)
      {
         float out_val = ctrl;

         audio_out_left [i] = out_val;
         audio_out_right [i] = out_val;
      }
   });
}