structure PangoRenderer :>
  PANGO_RENDERER
    where type 'a class_t = 'a PangoRendererClass.t
    where type glyph_t = PangoGlyph.t
    where type glyph_item_record_t = PangoGlyphItemRecord.t
    where type glyph_string_record_t = PangoGlyphStringRecord.t
    where type 'a font_class_t = 'a PangoFontClass.t
    where type 'a layout_class_t = 'a PangoLayoutClass.t
    where type layout_line_record_t = PangoLayoutLineRecord.t
    where type color_record_t = PangoColorRecord.t
    where type render_part_t = PangoRenderPart.t
    where type matrix_record_t = PangoMatrixRecord.t =
  struct
    val getType_ = _import "pango_renderer_get_type" : unit -> GObjectType.C.val_;
    val activate_ = _import "pango_renderer_activate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val deactivate_ = _import "pango_renderer_deactivate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val drawErrorUnderline_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_renderer_draw_error_underline" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val drawGlyph_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_renderer_draw_glyph" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoGlyph.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val drawGlyphItem_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6 =>
          (
            _import "mlton_pango_renderer_draw_glyph_item" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * PangoGlyphItemRecord.C.notnull PangoGlyphItemRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
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
    val drawGlyphs_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_renderer_draw_glyphs" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoGlyphStringRecord.C.notnull PangoGlyphStringRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val drawLayout_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_renderer_draw_layout" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val drawLayoutLine_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "pango_renderer_draw_layout_line" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val drawRectangle_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "pango_renderer_draw_rectangle" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoRenderPart.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
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
    val drawTrapezoid_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "pango_renderer_draw_trapezoid" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoRenderPart.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               * FFI.Double.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val getColor_ = fn x1 & x2 => (_import "pango_renderer_get_color" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoRenderPart.C.val_ -> PangoColorRecord.C.notnull PangoColorRecord.C.p;) (x1, x2)
    val getLayout_ = _import "pango_renderer_get_layout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLayoutLine_ = _import "pango_renderer_get_layout_line" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoLayoutLineRecord.C.notnull PangoLayoutLineRecord.C.p;
    val getMatrix_ = _import "pango_renderer_get_matrix" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoMatrixRecord.C.notnull PangoMatrixRecord.C.p;
    val partChanged_ = fn x1 & x2 => (_import "pango_renderer_part_changed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoRenderPart.C.val_ -> unit;) (x1, x2)
    val setColor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_renderer_set_color" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * PangoRenderPart.C.val_
               * unit PangoColorRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMatrix_ = fn x1 & x2 => (_import "pango_renderer_set_matrix" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit PangoMatrixRecord.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a PangoRendererClass.t
    type glyph_t = PangoGlyph.t
    type glyph_item_record_t = PangoGlyphItemRecord.t
    type glyph_string_record_t = PangoGlyphStringRecord.t
    type 'a font_class_t = 'a PangoFontClass.t
    type 'a layout_class_t = 'a PangoLayoutClass.t
    type layout_line_record_t = PangoLayoutLineRecord.t
    type color_record_t = PangoColorRecord.t
    type render_part_t = PangoRenderPart.t
    type matrix_record_t = PangoMatrixRecord.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self = (GObjectObjectClass.C.withPtr ---> I) activate_ self
    fun deactivate self = (GObjectObjectClass.C.withPtr ---> I) deactivate_ self
    fun drawErrorUnderline self x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        drawErrorUnderline_
        (
          self
           & x
           & y
           & width
           & height
        )
    fun drawGlyph self font glyph x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> PangoGlyph.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        drawGlyph_
        (
          self
           & font
           & glyph
           & x
           & y
        )
    fun drawGlyphItem self text glyphItem x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> PangoGlyphItemRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        drawGlyphItem_
        (
          self
           & text
           & glyphItem
           & x
           & y
        )
    fun drawGlyphs self font glyphs x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> PangoGlyphStringRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        drawGlyphs_
        (
          self
           & font
           & glyphs
           & x
           & y
        )
    fun drawLayout self layout x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        drawLayout_
        (
          self
           & layout
           & x
           & y
        )
    fun drawLayoutLine self line x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> PangoLayoutLineRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        drawLayoutLine_
        (
          self
           & line
           & x
           & y
        )
    fun drawRectangle self part x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> PangoRenderPart.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        drawRectangle_
        (
          self
           & part
           & x
           & y
           & width
           & height
        )
    fun drawTrapezoid self part y1 x11 x21 y2 x12 x22 =
      (
        GObjectObjectClass.C.withPtr
         &&&> PangoRenderPart.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        drawTrapezoid_
        (
          self
           & part
           & y1
           & x11
           & x21
           & y2
           & x12
           & x22
        )
    fun getColor self part = (GObjectObjectClass.C.withPtr &&&> PangoRenderPart.C.withVal ---> PangoColorRecord.C.fromPtr true) getColor_ (self & part)
    fun getLayout self = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr false) getLayout_ self
    fun getLayoutLine self = (GObjectObjectClass.C.withPtr ---> PangoLayoutLineRecord.C.fromPtr true) getLayoutLine_ self
    fun getMatrix self = (GObjectObjectClass.C.withPtr ---> PangoMatrixRecord.C.fromPtr false) getMatrix_ self
    fun partChanged self part = (GObjectObjectClass.C.withPtr &&&> PangoRenderPart.C.withVal ---> I) partChanged_ (self & part)
    fun setColor self part color =
      (
        GObjectObjectClass.C.withPtr
         &&&> PangoRenderPart.C.withVal
         &&&> PangoColorRecord.C.withOptPtr
         ---> I
      )
        setColor_
        (
          self
           & part
           & color
        )
    fun setMatrix self matrix = (GObjectObjectClass.C.withPtr &&&> PangoMatrixRecord.C.withOptPtr ---> I) setMatrix_ (self & matrix)
  end
