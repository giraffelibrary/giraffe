structure PangoFontMetrics :>
  PANGO_FONT_METRICS
    where type record_t = PangoFontMetricsRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_metrics_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getApproximateCharWidth_ = call (load_sym libpango "pango_font_metrics_get_approximate_char_width") (PangoFontMetricsRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getApproximateDigitWidth_ = call (load_sym libpango "pango_font_metrics_get_approximate_digit_width") (PangoFontMetricsRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getAscent_ = call (load_sym libpango "pango_font_metrics_get_ascent") (PangoFontMetricsRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getDescent_ = call (load_sym libpango "pango_font_metrics_get_descent") (PangoFontMetricsRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getStrikethroughPosition_ = call (load_sym libpango "pango_font_metrics_get_strikethrough_position") (PangoFontMetricsRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getStrikethroughThickness_ = call (load_sym libpango "pango_font_metrics_get_strikethrough_thickness") (PangoFontMetricsRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getUnderlinePosition_ = call (load_sym libpango "pango_font_metrics_get_underline_position") (PangoFontMetricsRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getUnderlineThickness_ = call (load_sym libpango "pango_font_metrics_get_underline_thickness") (PangoFontMetricsRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
    end
    type record_t = PangoFontMetricsRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getApproximateCharWidth self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.fromVal) getApproximateCharWidth_ self
    fun getApproximateDigitWidth self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.fromVal) getApproximateDigitWidth_ self
    fun getAscent self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.fromVal) getAscent_ self
    fun getDescent self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.fromVal) getDescent_ self
    fun getStrikethroughPosition self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.fromVal) getStrikethroughPosition_ self
    fun getStrikethroughThickness self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.fromVal) getStrikethroughThickness_ self
    fun getUnderlinePosition self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.fromVal) getUnderlinePosition_ self
    fun getUnderlineThickness self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.fromVal) getUnderlineThickness_ self
  end
