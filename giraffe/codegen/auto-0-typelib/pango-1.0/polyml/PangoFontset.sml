structure PangoFontset :>
  PANGO_FONTSET
    where type 'a class = 'a PangoFontsetClass.class
    where type 'a font_class = 'a PangoFontClass.class
    where type font_metrics_t = PangoFontMetricsRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_fontset_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getFont_ = call (load_sym libpango "pango_fontset_get_font") (PangoFontsetClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> PangoFontClass.PolyML.cPtr)
      val getMetrics_ = call (load_sym libpango "pango_fontset_get_metrics") (PangoFontsetClass.PolyML.cPtr --> PangoFontMetricsRecord.PolyML.cPtr)
    end
    type 'a class = 'a PangoFontsetClass.class
    type 'a font_class = 'a PangoFontClass.class
    type font_metrics_t = PangoFontMetricsRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFont self wc = (PangoFontsetClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> PangoFontClass.FFI.fromPtr true) getFont_ (self & wc)
    fun getMetrics self = (PangoFontsetClass.FFI.withPtr ---> PangoFontMetricsRecord.FFI.fromPtr true) getMetrics_ self
  end
