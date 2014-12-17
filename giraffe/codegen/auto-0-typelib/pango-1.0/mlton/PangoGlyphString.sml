structure PangoGlyphString :>
  PANGO_GLYPH_STRING
    where type record_t = PangoGlyphStringRecord.t
    where type rectanglerecord_t = PangoRectangleRecord.t
    where type 'a fontclass_t = 'a PangoFontClass.t =
  struct
    val getType_ = _import "pango_glyph_string_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "pango_glyph_string_new" : unit -> PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p;
    val copy_ = _import "pango_glyph_string_copy" : PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p -> PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p;
    val extents_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_glyph_string_extents" :
              PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val extentsRange_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "pango_glyph_string_extents_range" :
              PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               * PangoRectangleRecord.C.notnull PangoRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getWidth_ = _import "pango_glyph_string_get_width" : PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p -> FFI.Int32.C.val_;
    val setSize_ = fn x1 & x2 => (_import "pango_glyph_string_set_size" : PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type record_t = PangoGlyphStringRecord.t
    type rectanglerecord_t = PangoRectangleRecord.t
    type 'a fontclass_t = 'a PangoFontClass.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> PangoGlyphStringRecord.C.fromPtr true) new_ ()
    fun copy self = (PangoGlyphStringRecord.C.withPtr ---> PangoGlyphStringRecord.C.fromPtr true) copy_ self
    fun extents self font =
      let
        val inkRect
         & logicalRect
         & () =
          (
            PangoGlyphStringRecord.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             &&&> PangoRectangleRecord.C.withNewPtr
             ---> PangoRectangleRecord.C.fromPtr true
                   && PangoRectangleRecord.C.fromPtr true
                   && I
          )
            extents_
            (
              self
               & font
               & ()
               & ()
            )
      in
        (inkRect, logicalRect)
      end
    fun extentsRange self start end' font inkRect logicalRect =
      (
        PangoGlyphStringRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GObjectObjectClass.C.withPtr
         &&&> PangoRectangleRecord.C.withPtr
         &&&> PangoRectangleRecord.C.withPtr
         ---> I
      )
        extentsRange_
        (
          self
           & start
           & end'
           & font
           & inkRect
           & logicalRect
        )
    fun getWidth self = (PangoGlyphStringRecord.C.withPtr ---> FFI.Int32.C.fromVal) getWidth_ self
    fun setSize self newLen = (PangoGlyphStringRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setSize_ (self & newLen)
  end
