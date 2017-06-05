structure PangoRenderer :>
  PANGO_RENDERER
    where type 'a class = 'a PangoRendererClass.class
    where type glyph_item_t = PangoGlyphItemRecord.t
    where type glyph_string_t = PangoGlyphStringRecord.t
    where type 'a font_class = 'a PangoFontClass.class
    where type 'a layout_class = 'a PangoLayoutClass.class
    where type layout_line_t = PangoLayoutLineRecord.t
    where type color_t = PangoColorRecord.t
    where type render_part_t = PangoRenderPart.t
    where type matrix_t = PangoMatrixRecord.t =
  struct
    val getType_ = _import "pango_renderer_get_type" : unit -> GObjectType.FFI.val_;
    val activate_ = _import "pango_renderer_activate" : PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p -> unit;
    val deactivate_ = _import "pango_renderer_deactivate" : PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p -> unit;
    val drawErrorUnderline_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "pango_renderer_draw_error_underline" :
              PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p
               * PangoFontClass.FFI.notnull PangoFontClass.FFI.p
               * GUInt32.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
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
              PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * PangoGlyphItemRecord.FFI.notnull PangoGlyphItemRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p
               * PangoFontClass.FFI.notnull PangoFontClass.FFI.p
               * PangoGlyphStringRecord.FFI.notnull PangoGlyphStringRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p
               * PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p
               * PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p
               * PangoRenderPart.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p
               * PangoRenderPart.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
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
    val getColor_ = fn x1 & x2 => (_import "pango_renderer_get_color" : PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p * PangoRenderPart.FFI.val_ -> PangoColorRecord.FFI.notnull PangoColorRecord.FFI.p;) (x1, x2)
    val getLayout_ = _import "pango_renderer_get_layout" : PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p -> PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p;
    val getLayoutLine_ = _import "pango_renderer_get_layout_line" : PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p -> PangoLayoutLineRecord.FFI.notnull PangoLayoutLineRecord.FFI.p;
    val getMatrix_ = _import "pango_renderer_get_matrix" : PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p -> PangoMatrixRecord.FFI.notnull PangoMatrixRecord.FFI.p;
    val partChanged_ = fn x1 & x2 => (_import "pango_renderer_part_changed" : PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p * PangoRenderPart.FFI.val_ -> unit;) (x1, x2)
    val setColor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "pango_renderer_set_color" :
              PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p
               * PangoRenderPart.FFI.val_
               * unit PangoColorRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMatrix_ = fn x1 & x2 => (_import "pango_renderer_set_matrix" : PangoRendererClass.FFI.notnull PangoRendererClass.FFI.p * unit PangoMatrixRecord.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a PangoRendererClass.class
    type glyph_item_t = PangoGlyphItemRecord.t
    type glyph_string_t = PangoGlyphStringRecord.t
    type 'a font_class = 'a PangoFontClass.class
    type 'a layout_class = 'a PangoLayoutClass.class
    type layout_line_t = PangoLayoutLineRecord.t
    type color_t = PangoColorRecord.t
    type render_part_t = PangoRenderPart.t
    type matrix_t = PangoMatrixRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activate self = (PangoRendererClass.FFI.withPtr ---> I) activate_ self
    fun deactivate self = (PangoRendererClass.FFI.withPtr ---> I) deactivate_ self
    fun drawErrorUnderline self x y width height =
      (
        PangoRendererClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        PangoRendererClass.FFI.withPtr
         &&&> PangoFontClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
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
        PangoRendererClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> PangoGlyphItemRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        PangoRendererClass.FFI.withPtr
         &&&> PangoFontClass.FFI.withPtr
         &&&> PangoGlyphStringRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        PangoRendererClass.FFI.withPtr
         &&&> PangoLayoutClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        PangoRendererClass.FFI.withPtr
         &&&> PangoLayoutLineRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        PangoRendererClass.FFI.withPtr
         &&&> PangoRenderPart.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
        PangoRendererClass.FFI.withPtr
         &&&> PangoRenderPart.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
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
    fun getColor self part = (PangoRendererClass.FFI.withPtr &&&> PangoRenderPart.FFI.withVal ---> PangoColorRecord.FFI.fromPtr true) getColor_ (self & part)
    fun getLayout self = (PangoRendererClass.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self
    fun getLayoutLine self = (PangoRendererClass.FFI.withPtr ---> PangoLayoutLineRecord.FFI.fromPtr true) getLayoutLine_ self
    fun getMatrix self = (PangoRendererClass.FFI.withPtr ---> PangoMatrixRecord.FFI.fromPtr false) getMatrix_ self
    fun partChanged self part = (PangoRendererClass.FFI.withPtr &&&> PangoRenderPart.FFI.withVal ---> I) partChanged_ (self & part)
    fun setColor self part color =
      (
        PangoRendererClass.FFI.withPtr
         &&&> PangoRenderPart.FFI.withVal
         &&&> PangoColorRecord.FFI.withOptPtr
         ---> I
      )
        setColor_
        (
          self
           & part
           & color
        )
    fun setMatrix self matrix = (PangoRendererClass.FFI.withPtr &&&> PangoMatrixRecord.FFI.withOptPtr ---> I) setMatrix_ (self & matrix)
  end
