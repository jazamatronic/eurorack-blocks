#!/usr/bin/env python
#
#     deploy.py
#     Copyright (c) 2020 Raphael Dinge
#
#Tab=3########################################################################


##### IMPORT #################################################################

import argparse
import os
import subprocess
import sys

sys.path.insert(0, "../build-system/")
import erbb



##############################################################################

if sys.version_info < (2, 7):
   print >>sys.stderr, 'This script requires python 2.7 or greater.'
   sys.exit (1)

PATH_THIS = os.path.abspath (os.path.dirname (__file__))



##############################################################################

"""
==============================================================================
Name : parse_args
==============================================================================
"""

def parse_args ():
   arg_parser = argparse.ArgumentParser ()

   required = arg_parser.add_argument_group('required named arguments')
   required.add_argument (
      '--target',
      help = 'The target firmware to download.',
      required=True
   )

   return arg_parser.parse_args (sys.argv[1:])



if __name__ == '__main__':
   try:
      args = parse_args ()
      erbb.deploy (args.target, PATH_THIS)

   except subprocess.CalledProcessError as error:
      print >>sys.stderr, 'Run command exited with %d' % error.returncode
      sys.exit (1)