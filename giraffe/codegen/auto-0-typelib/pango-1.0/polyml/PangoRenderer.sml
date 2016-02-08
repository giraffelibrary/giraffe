structure PangoRenderer :>
  PANGO_RENDERER
    where type 'a class_t = 'a PangoRendererClass.t
    where type glyph_item_record_t = PangoGlyphItemRecord.t
    where type glyph_string_record_t = PangoGlyphStringRecord.t
    where type 'a font_class_t = 'a PangoFontClass.t
    where type 'a layout_class_t = 'a PangoLayoutClass.t
    where type layout_line_record_t = PangoLayoutLineRecord.t
    where type color_record_t = PangoColorRecord.t
    where type render_part_t = PangoRenderPart.t
    where type matrix_record_t = PangoMatrixRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_renderer_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val activate_ = call (load_sym libpango "pango_renderer_activate") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val deactivate_ = call (load_sym libpango "pango_renderer_deactivate") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val drawErrorUnderline_ =
        call (load_sym libpango "pango_renderer_draw_error_underline")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val drawGlyph_ =
        call (load_sym libpango "pango_renderer_draw_glyph")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val drawGlyphItem_ =
        call (load_sym libpango "pango_renderer_draw_glyph_item")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INOPTPTR
             &&> PangoGlyphItemRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val drawGlyphs_ =
        call (load_sym libpango "pango_renderer_draw_glyphs")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> PangoGlyphStringRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val drawLayout_ =
        call (load_sym libpango "pango_renderer_draw_layout")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val drawLayoutLine_ =
        call (load_sym libpango "pango_renderer_draw_layout_line")
          (
            GObjectObjectClass.PolyML.PTR
             &&> PangoLayoutLineRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val drawRectangle_ =
        call (load_sym libpango "pango_renderer_draw_rectangle")
          (
            GObjectObjectClass.PolyML.PTR
             &&> PangoRenderPart.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val drawTrapezoid_ =
        call (load_sym libpango "pango_renderer_draw_trapezoid")
          (
            GObjectObjectClass.PolyML.PTR
             &&> PangoRenderPart.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getColor_ = call (load_sym libpango "pango_renderer_get_color") (GObjectObjectClass.PolyML.PTR &&> PangoRenderPart.PolyML.VAL --> PangoColorRecord.PolyML.PTR)
      val getLayout_ = call (load_sym libpango "pango_renderer_get_layout") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getLayoutLine_ = call (load_sym libpango "pango_renderer_get_layout_line") (GObjectObjectClass.PolyML.PTR --> PangoLayoutLineRecord.PolyML.PTR)
      val getMatrix_ = call (load_sym libpango "pango_renderer_get_matrix") (GObjectObjectClass.PolyML.PTR --> PangoMatrixRecord.PolyML.PTR)
      val partChanged_ = call (load_sym libpango "pango_renderer_part_changed") (GObjectObjectClass.PolyML.PTR &&> PangoRenderPart.PolyML.VAL --> FFI.PolyML.VOID)
      val setColor_ =
        call (load_sym libpango "pango_renderer_set_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> PangoRenderPart.PolyML.VAL
             &&> PangoColorRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val setMatrix_ = call (load_sym libpango "pango_renderer_set_matrix") (GObjectObjectClass.PolyML.PTR &&> PangoMatrixRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a PangoRendererClass.t
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.UInt32.C.withVal
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
         &&&> Utf8.C.withConstOptPtr
         &&&> PangoGlyphItemRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
