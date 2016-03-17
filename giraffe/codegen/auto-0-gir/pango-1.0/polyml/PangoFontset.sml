structure PangoFontset :>
  PANGO_FONTSET
    where type 'a class = 'a PangoFontsetClass.class
    where type 'a font_class = 'a PangoFontClass.class
    where type font_metrics_t = PangoFontMetricsRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_fontset_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getFont_ = call (load_sym libpango "pango_fontset_get_font") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getMetrics_ = call (load_sym libpango "pango_fontset_get_metrics") (GObjectObjectClass.PolyML.cPtr --> PangoFontMetricsRecord.PolyML.cPtr)
    end
    type 'a class = 'a PangoFontsetClass.class
    type 'a font_class = 'a PangoFontClass.class
    type font_metrics_t = PangoFontMetricsRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFont self wc = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> PangoFontClass.C.fromPtr true) getFont_ (self & wc)
    fun getMetrics self = (GObjectObjectClass.C.withPtr ---> PangoFontMetricsRecord.C.fromPtr true) getMetrics_ self
  end
