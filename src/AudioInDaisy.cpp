/*****************************************************************************

      AudioInDaisy.cpp
      Copyright (c) 2020 Raphael DINGE

*Tab=3***********************************************************************/



/*\\\ INCLUDE FILES \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

#include "erb/AudioInDaisy.h"

#include "erb/Module.h"

#include "per/gpio.h"



namespace erb
{



/*\\\ PUBLIC \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

/*
==============================================================================
Name : ctor
==============================================================================
*/

AudioInDaisy::AudioInDaisy (Module & module, Pin pin)
:  _module (module)
,  _channel (to_channel (pin))
{
   module.add (*this);
}



/*
==============================================================================
Name : size
==============================================================================
*/

AudioInDaisy::operator Buffer () const
{
   return _buffer;
}



/*
==============================================================================
Name : size
==============================================================================
*/

size_t   AudioInDaisy::size () const
{
   return _buffer.size ();
}



/*
==============================================================================
Name : operator []
==============================================================================
*/

float AudioInDaisy::operator [] (size_t index)
{
   return _buffer [index];
}



/*\\\ INTERNAL \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

/*
==============================================================================
Name : impl_notify_audio_buffer_start
==============================================================================
*/

void  AudioInDaisy::impl_notify_audio_buffer_start ()
{
   const auto & buffer = _module.impl_onboard_codec_buffer_input ();

   _buffer = buffer [_channel];
}



/*\\\ PROTECTED \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/



/*\\\ PRIVATE \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

/*
==============================================================================
Name : to_channel
==============================================================================
*/

size_t   AudioInDaisy::to_channel (Pin pin)
{
   switch (pin)
   {
   case Pin::Left:
   case Pin::Channel0:
      return 0;

   case Pin::Right:
   case Pin::Channel1:
      return 1;
   }

   __builtin_unreachable ();
}



}  // namespace erb



/*\\\ EOF \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
