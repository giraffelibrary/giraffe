signature PANGO_RENDERER =
  sig
    type 'a class_t
    type matrixrecord_t
    type renderpart_t
    type colorrecord_t
    type layoutlinerecord_t
    type 'a layoutclass_t
    type 'a fontclass_t
    type glyphstringrecord_t
    type glyphitemrecord_t
    val getType : unit -> GObject.Type.t
    val activate : 'a class_t -> unit
    val deactivate : 'a class_t -> unit
    val drawErrorUnderline :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawGlyph :
      'a class_t
       -> 'b fontclass_t
       -> LargeInt.int
       -> real
       -> real
       -> unit
    val drawGlyphItem :
      'a class_t
       -> string option
       -> glyphitemrecord_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawGlyphs :
      'a class_t
       -> 'b fontclass_t
       -> glyphstringrecord_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawLayout :
      'a class_t
       -> 'b layoutclass_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawLayoutLine :
      'a class_t
       -> layoutlinerecord_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawRectangle :
      'a class_t
       -> renderpart_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val drawTrapezoid :
      'a class_t
       -> renderpart_t
       -> real
       -> real
       -> real
       -> real
       -> real
       -> real
       -> unit
    val getColor :
      'a class_t
       -> renderpart_t
       -> colorrecord_t
    val getLayout : 'a class_t -> base layoutclass_t
    val getLayoutLine : 'a class_t -> layoutlinerecord_t
    val getMatrix : 'a class_t -> matrixrecord_t
    val partChanged :
      'a class_t
       -> renderpart_t
       -> unit
    val setColor :
      'a class_t
       -> renderpart_t
       -> colorrecord_t option
       -> unit
    val setMatrix :
      'a class_t
       -> matrixrecord_t option
       -> unit
  end
