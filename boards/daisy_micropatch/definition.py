##############################################################################
#
#     definition.py
#     Copyright (c) 2020 Raphael DINGE
#
#Tab=3########################################################################



{
   'class': 'erb::BoardDaisyMicropatch',
   'include': 'BoardDaisyMicropatch.h',
   'pins': {
      'CI1': {
         'accept': ['CvIn'],
         'bind': 'adc(4)',
      },
      'CI2': {
         'accept': ['CvIn'],
         'bind': 'adc(5)',
      },
      'CI3': {
         'accept': ['CvIn'],
         'bind': 'adc(6)',
      },
      'CI4': {
         'accept': ['CvIn'],
         'bind': 'adc(7)',
      },

      'CO': {
         'accept': ['CvOut'],
         'bind': 'dac(0)',
      },

      'GI1': {
         'accept': ['GateIn'],
         'bind': 'gpi(0)',
      },

      'GI2': {
         'accept': ['GateIn'],
         'bind': 'gpi(1)',
      },

      'GO1': {
         'accept': ['GateOut'],
         'bind': 'gpo(0)',
      },

      'GO2': {
         'accept': ['GateOut'],
         'bind': 'gpo(1)',
      },

      'L': {
         'type': 'dac',
         'accept': ['Led'],
         'bind': 'dac(1)',
      },

      'P1': {
         'accept': ['Pot'],
         'bind': 'adc(0)',
      },
      'P2': {
         'accept': ['Pot'],
         'bind': 'adc(1)',
      },
      'P3': {
         'accept': ['Pot'],
         'bind': 'adc(2)',
      },
      'P4': {
         'accept': ['Pot'],
         'bind': 'adc(3)',
      },

      'B1': {
         'accept': ['Button'],
         'bind': 'gpi(2)',
      },

      'B2': {
         'accept': ['Switch'],
         'bind': 'gpi(3)',
      },
      'B3': {
         'accept': ['Switch'],
         'bind': 'gpi(4)',
      },

      'AI1': {
         'accept': ['AudioIn'],
         'bind': 'audioin(0)',
      },
      'AI2': {
         'accept': ['AudioIn'],
         'bind': 'audioin(1)',
      },

      'AO1': {
         'accept': ['AudioOut'],
         'bind': 'audioout(0)',
      },
      'AO2': {
         'accept': ['AudioOut'],
         'bind': 'audioout(1)',
      },
   }
}
