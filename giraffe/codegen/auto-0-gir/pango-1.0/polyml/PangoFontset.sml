structure PangoFontset :>
  PANGO_FONTSET
    where type 'a class_t = 'a PangoFontsetClass.t
    where type 'a font_class_t = 'a PangoFontClass.t
    where type font_metrics_record_t = PangoFontMetricsRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_fontset_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getFont_ = call (load_sym libpango "pango_fontset_get_font") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getMetrics_ = call (load_sym libpango "pango_fontset_get_metrics") (GObjectObjectClass.PolyML.cPtr --> PangoFontMetricsRecord.PolyML.cPtr)
    end
    type 'a class_t = 'a PangoFontsetClass.t
    type 'a font_class_t = 'a PangoFontClass.t
    type font_metrics_record_t = PangoFontMetricsRecord.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFont self wc = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> PangoFontClass.C.fromPtr true) getFont_ (self & wc)
    fun getMetrics self = (GObjectObjectClass.C.withPtr ---> PangoFontMetricsRecord.C.fromPtr true) getMetrics_ self
  end
