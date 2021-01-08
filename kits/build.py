#!/usr/bin/env python
#
#     build.py
#
#Tab=3########################################################################



##### IMPORT #################################################################

import logging
import os
import shutil
import subprocess
import sys
import zipfile



##############################################################################

if sys.version_info < (2, 7):
   print >>sys.stderr, 'This script requires python 2.7 or greater.'
   sys.exit (1)

PATH_THIS = os.path.abspath (os.path.dirname (__file__))
PATH_ROOT = os.path.abspath (os.path.dirname (PATH_THIS))




"""
==============================================================================
Name : zipdir
==============================================================================
"""

def zipdir (path, zip_file):
   for root, dirs, files in os.walk (path):
      for file in files:
         zip_file.write (os.path.join (root, file))



"""
==============================================================================
Name : compress_gerber
==============================================================================
"""

def compress_gerber ():
   logging.info ('Compressing PCB gerber files')

   output_dir = os.path.join (PATH_THIS, 'artifacts')
   zip_path = os.path.join (output_dir, 'panel-daisy-gerber.zip')
   zip_file = zipfile.ZipFile (zip_path, 'w', zipfile.ZIP_DEFLATED)
   gerber_dir = os.path.join (output_dir, 'gerber')
   zipdir (gerber_dir, zip_file)
   zip_file.close ()
   shutil.rmtree (gerber_dir)



"""
==============================================================================
Name : build
Description :
   The python executable bundled in Kicad 5.1.9 was not compiled with zlib.
   Therefore we need to separate into two scripts to be able to conmpress
   the gerber directory.
==============================================================================
"""

def build ():
   kicad_path = '/Applications/KiCad/kicad.app/Contents/Frameworks/Python.framework/Versions/2.7/bin/python2.7'

   subprocess.check_call (
      [
         kicad_path,
         os.path.join (PATH_THIS, 'generate.py'),
      ],
      cwd = PATH_THIS
   )

   compress_gerber ()



##############################################################################

if __name__ == '__main__':
   logging.basicConfig(format='%(message)s', level=logging.INFO, stream=sys.stdout)

   try:
      sys.exit (build ())

   except subprocess.CalledProcessError as error:
      print >>sys.stderr, 'Build command exited with %d' % error.returncode
      sys.exit(1)
