#!/usr/bin/env python
#
#     test_generator_front_pcb.py
#     Copyright (c) 2020 Raphael DINGE
#
#Tab=3########################################################################



import os
import unittest
import traceback

from .. import ast
from . import mock

from ..generators.front_pcb.kicad_pcb import KicadPcb
from ..generators.front_pcb import s_expression
from ..generators.front_pcb.s_expression import Writer


PATH_THIS = os.path.abspath (os.path.dirname (__file__))
PATH_ARTIFACTS = os.path.abspath (os.path.join (PATH_THIS, 'artifacts'))
PATH_ERBUI = os.path.abspath (os.path.dirname (PATH_THIS))
PATH_FRONT_PCB = os.path.join (PATH_ERBUI, 'generators', 'front_pcb')


class TestGeneratorFrontPcb (unittest.TestCase):

   def setUp(self):
      if not os.path.exists (PATH_ARTIFACTS):
         os.makedirs (PATH_ARTIFACTS)

   def load_component (self, path):
      def filter_func (node):
         if isinstance (node, s_expression.Symbol) and node.value == 'kicad_pcb':
            return False

         if node.kind in ['version', 'host', 'general', 'page', 'layers', 'setup', 'net_class', 'net']:
            return False

         # keep all the rest (modules, text, etc.)
         return True

      with open (path, 'r', encoding='utf-8') as file:
         content = file.read ()
      parser = s_expression.Parser ()
      component = parser.parse (content, 'kicad_pcb')
      component.entities = list (filter (filter_func, component.entities))

      return component

   def test_001 (self):
      gen = KicadPcb ()
      component = self.load_component (
         os.path.join (PATH_FRONT_PCB, 'alpha.9mm.wire', 'alpha.9mm.wire.kicad_pcb')
      )

      writer = Writer ()
      writer.write (component, os.path.join (PATH_ARTIFACTS, 'alpha.9mm.load.kicad_pcb'))

   def test_002 (self):
      gen = KicadPcb ()
      component = self.load_component (
         os.path.join (PATH_FRONT_PCB, 'thonk.pj398sm.wire', 'thonk.pj398sm.wire.kicad_pcb')
      )

      position = ast.Position (
         ast.DistanceLiteral (mock.literal ('10mm'), 'mm'),
         ast.DistanceLiteral (mock.literal ('20mm'), 'mm'),
      )
      component = gen.move (component, position)

      writer = Writer ()
      writer.write (component, os.path.join (PATH_ARTIFACTS, 'thonk.pj398sm.move.kicad_pcb'))

   def test_002b (self):
      gen = KicadPcb ()
      component = self.load_component (
         os.path.join (PATH_FRONT_PCB, 'alpha.9mm.wire', 'alpha.9mm.wire.kicad_pcb')
      )

      position = ast.Position (
         ast.DistanceLiteral (mock.literal ('10mm'), 'mm'),
         ast.DistanceLiteral (mock.literal ('20mm'), 'mm'),
      )
      component = gen.move (component, position)

      writer = Writer ()
      writer.write (component, os.path.join (PATH_ARTIFACTS, 'alpha.9mm.move.kicad_pcb'))

   def test_003 (self):
      module = ast.Module (mock.identifier ('test_generator_front_pcb_003'), None)
      module.add (ast.Width (ast.DistanceLiteral (mock.literal ('10hp'), 'hp')))
      module.add (ast.Board (mock.identifier ("kivu12")))
      module.add (ast.Route (mock.keyword ("wire")))

      control = ast.Control (
         mock.identifier ('test'),
         mock.keyword ('Trim')
      )
      control.reference = 'RV1'
      position = ast.Position (
         ast.DistanceLiteral (mock.literal ('5hp'), 'hp'),
         ast.DistanceLiteral (mock.literal ('32mm'), 'mm'),
      )
      control.add (position)
      style = ast.Style ([mock.keyword ('songhuei.9mm')])
      control.add (style)
      pin = ast.Pin (mock.identifier ('P1'))
      control.add (pin)
      module.add (control)

      control = ast.Control (
         mock.identifier ('test'),
         mock.keyword ('Pot')
      )
      control.reference = 'RV2'
      position = ast.Position (
         ast.DistanceLiteral (mock.literal ('5hp'), 'hp'),
         ast.DistanceLiteral (mock.literal ('64mm'), 'mm'),
      )
      control.add (position)
      style = ast.Style ([mock.keyword ('rogan'), mock.keyword ('6ps')])
      control.add (style)
      pin = ast.Pin (mock.identifier ('P2'))
      control.add (pin)
      module.add (control)

      control = ast.Control (
         mock.identifier ('test'),
         mock.keyword ('CvIn')
      )
      control.reference = 'J1'
      position = ast.Position (
         ast.DistanceLiteral (mock.literal ('5hp'), 'hp'),
         ast.DistanceLiteral (mock.literal ('96mm'), 'mm'),
      )
      control.add (position)
      style = ast.Style ([mock.keyword ('thonk.pj398sm.hex')])
      control.add (style)
      pin = ast.Pin (mock.identifier ('CI1'))
      control.add (pin)
      module.add (control)

      module.board.load_builtin ()

      gen = KicadPcb ()
      gen.generate_module (PATH_ARTIFACTS, module)



if __name__ == '__main__':
   unittest.main ()
