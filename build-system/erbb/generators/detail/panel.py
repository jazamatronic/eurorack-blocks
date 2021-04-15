##############################################################################
#
#     panel.py
#     Copyright (c) 2020 Raphael DINGE
#
#Tab=3########################################################################



import cairo
import math
import os



MM_TO_PT = 72.0 / 25.4
PT_TO_MM = 1.0 / MM_TO_PT



class Panel:
   def __init__ (self):
      self.width = None
      self.height = 128.5

      self.font_family = 'D-DIN Bold'

      self.header_center_y = 5.0#mm
      self.footer_center_y = -5.0#mm

      self.positioning_margin = 0.75#mm

      self.current_box = None
      self.current_font_height = None
      self.current_position_x = None
      self.current_position_y = None


   #--------------------------------------------------------------------------

   def generate_module (self, context, module, render_back=False):

      context.set_fill_rule (cairo.FILL_RULE_EVEN_ODD)

      self.width = module.width
      self.footer_center_y += self.height

      self.current_font_height = 14.0#pt
      self.current_position_x = self.width * 0.5
      self.current_position_y = self.height * 0.5

      if render_back:
         self.generate_back (context, module)

      self.generate_header (context, module, module.header)
      self.generate_footer (context, module, module.footer)

      for label in module.labels:
         self.generate_label (context, module, label)

      for image in module.images:
         self.generate_image (context, module, image)

      for line in module.lines:
         self.generate_line (context, module, line)

      for control in module.controls:
         self.generate_control (context, module, control)


   #--------------------------------------------------------------------------

   def generate_back (self, context, module):
      context.rectangle (0, 0, self.width * MM_TO_PT, self.height * MM_TO_PT)

      material = module.material

      if material.is_aluminum_natural or material.is_brushed_aluminum_natural:
         panel_gray = 0.9

      elif material.is_aluminum_black or material.is_brushed_aluminum_black or material.is_aluminum_coated_black:
         panel_gray = 0.1

      elif material.is_aluminum_coated_white:
         panel_gray = 1.0

      context.set_source_rgb (panel_gray, panel_gray, panel_gray)
      context.fill()


   #--------------------------------------------------------------------------

   def generate_header (self, context, module, header):
      old_current_position_y = self.current_position_y
      self.current_position_y = self.header_center_y

      for label in header.labels:
         self.generate_label (context, module, label)

      for image in header.images:
         self.generate_image (context, module, image)

      self.current_position_y = old_current_position_y


   #--------------------------------------------------------------------------

   def generate_footer (self, context, module, footer):
      old_current_position_y = self.current_position_y
      self.current_position_y = self.footer_center_y

      for label in footer.labels:
         self.generate_label (context, module, label)

      for image in footer.images:
         self.generate_image (context, module, image)

      self.current_position_y = old_current_position_y


   #--------------------------------------------------------------------------

   def generate_control (self, context, module, control):
      old_current_position_x = self.current_position_x
      self.current_position_x = control.position.x

      old_current_position_y = self.current_position_y
      self.current_position_y = control.position.y

      old_current_font_height = self.current_font_height
      self.current_font_height = 8.5#pt

      box = self.get_style_box (control.style)

      control.rotation = (control.rotation + 360) % 360

      if control.rotation == 0:
         pass # nothing

      elif control.rotation == 90:
         box.top = box.right
         box.right = box.bottom
         box.bottom = box.left
         box.left = box.top

      elif control.rotation == 180:
         box.top, box.bottom = box.top, box.bottom
         box.left, box.right = box.left, box.right

      elif control.rotation == 270:
         box.left = box.bottom
         box.bottom = box.right
         box.right = box.top
         box.top = box.left

      else:
         raise Exception ('unsupported angle value %d', control.rotation)

      self.current_box = box

      for label in control.labels:
         self.generate_label (context, module, label, control)

      self.current_box = None
      self.current_font_height = old_current_font_height
      self.current_position_x = old_current_position_x
      self.current_position_y = old_current_position_y


   #--------------------------------------------------------------------------

   class Box:
      def __init__ (self, left, top, right, bottom):
         # distances from center, always positive
         self.left = left
         self.top = top
         self.right = right
         self.bottom = bottom

   # Reference:
   # Rogan: https://rogancorp.com/product/pt-series-pointer-control-knobs/
   # Dailywell: https://www.thonk.co.uk/wp-content/uploads/2017/05/DW1-SPDT-ON-ON-2MS1T1B1M2QES.pdf
   # Thonkiconn: https://www.thonk.co.uk/wp-content/uploads/2018/07/Thonkiconn_Jack_Datasheet-new.jpg
   # C&K: https://www.thonk.co.uk/wp-content/uploads/2015/01/CK-Switch.pdf

   def get_style_box (self, style):
      if style.is_rogan_6ps:
         radius = 31.75 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      elif style.is_rogan_5ps:
         radius = 21.33 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      elif style.is_rogan_3ps:
         radius = 18.47 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      elif style.is_rogan_2ps:
         radius = 15.75 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      elif style.is_rogan_1ps:
         radius = 14.38 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      elif style.is_songhuei_9mm:
         radius = 6.5 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      elif style.is_dailywell_2ms:
         return Panel.Box (3.5, 4.0, 3.5, 4.0)

      elif style.is_led_3mm:
         radius = 3.0 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      elif style.is_thonk_pj398sm:
         radius = 8.0 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      elif style.is_ck_d6_black:
         radius = 9.0 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      elif style.is_tl1105:
         radius = 5.5 * 0.5
         return Panel.Box (radius, radius, radius, radius)

      else:
         raise Exception ('unsupported control style %s' % style.value)


   #--------------------------------------------------------------------------

   def generate_label (self, context, module, label, control=None):
      font_family = self.font_family
      font_size = self.current_font_height

      if label.font: # override
         font_family = label.font.family
         font_size = label.font.size

      context.select_font_face (
         font_family, cairo.FONT_SLANT_NORMAL, cairo.FONT_WEIGHT_NORMAL
      )
      context.set_font_size (font_size)

      position_x = self.current_position_x
      position_y = self.current_position_y

      if label.position: # override
         position_x = label.position.x
         position_y = label.position.y

      elif label.positioning.is_center:
         align_x = 0.5
         align_y = 0.5

      elif label.positioning.is_left:
         position_x -= self.current_box.left + self.positioning_margin
         align_x = 1
         align_y = 0.5

      elif label.positioning.is_top:
         position_y -= self.current_box.top + self.positioning_margin
         align_x = 0.5
         align_y = 0

      elif label.positioning.is_right:
         position_x += self.current_box.right + self.positioning_margin
         align_x = 0
         align_y = 0.5

      elif label.positioning.is_bottom:
         position_y += self.current_box.bottom + self.positioning_margin
         align_x = 0.5
         align_y = 1

      else:
         raise Exception ('unsupported positioning %s' % label.positioning.value)

      if label.offset:
         position_x += label.offset.x
         position_y += label.offset.y

      material = module.material

      if material.is_aluminum_natural or material.is_brushed_aluminum_natural or material.is_aluminum_coated_white:
         if control is not None and control.is_type_out:
            fill_gray = 0.3
         else:
            fill_gray = 0.0
      elif material.is_aluminum_black or material.is_brushed_aluminum_black or material.is_aluminum_coated_black:
         fill_gray = 1.0

      xbearing, ybearing, width_pt, height_pt, dx, dy = context.text_extents (label.text)

      if control is not None and control.is_type_out:
         self.generate_back_out_path (context, module, control)

      context.move_to (
         position_x * MM_TO_PT - width_pt * align_x,
         position_y * MM_TO_PT + height_pt * align_y
      )
      context.text_path (label.text)
      context.set_source_rgb (fill_gray, fill_gray, fill_gray)
      context.fill ()


   #--------------------------------------------------------------------------

   def generate_back_out_path (self, context, module, control):

      left = (control.position.x - 5.4) * MM_TO_PT
      right = (control.position.x + 5.4) * MM_TO_PT
      top = (control.position.y - 8.4) * MM_TO_PT
      bottom = (control.position.y + 5.4) * MM_TO_PT
      radius = 2.0 * MM_TO_PT
      degrees = math.pi / 180.0

      context.new_sub_path ()
      context.arc (right - radius, top + radius, radius, -90 * degrees, 0 * degrees)
      context.arc (right - radius, bottom - radius, radius, 0 * degrees, 90 * degrees)
      context.arc (left + radius, bottom - radius, radius, 90 * degrees, 180 * degrees)
      context.arc (left + radius, top + radius, radius, 180 * degrees, 270 * degrees)
      context.close_path ()


   #--------------------------------------------------------------------------

   def generate_line (self, context, module, line):
      for index, position in enumerate (line.points):
         if index == 0:
            context.move_to (position.x * MM_TO_PT, position.y * MM_TO_PT)
         else:
            context.line_to (position.x * MM_TO_PT, position.y * MM_TO_PT)

      material = module.material

      if material.is_aluminum_natural or material.is_brushed_aluminum_natural or material.is_aluminum_coated_white:
         line_gray = 0.0

      elif material.is_aluminum_black or material.is_brushed_aluminum_black or material.is_aluminum_coated_black:
         line_gray = 1.0

      context.set_source_rgb (line_gray, line_gray, line_gray)
      context.set_line_width (0.7)
      context.set_line_join (cairo.LineJoin.ROUND)
      context.set_line_cap (cairo.LineCap.BUTT)
      context.stroke ()