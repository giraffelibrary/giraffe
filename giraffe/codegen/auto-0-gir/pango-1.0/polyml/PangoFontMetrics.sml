structure PangoFontMetrics :>
  PANGO_FONT_METRICS
    where type t = PangoFontMetricsRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_font_metrics_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getApproximateCharWidth_ = call (load_sym libpango "pango_font_metrics_get_approximate_char_width") (PangoFontMetricsRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getApproximateDigitWidth_ = call (load_sym libpango "pango_font_metrics_get_approximate_digit_width") (PangoFontMetricsRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getAscent_ = call (load_sym libpango "pango_font_metrics_get_ascent") (PangoFontMetricsRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getDescent_ = call (load_sym libpango "pango_font_metrics_get_descent") (PangoFontMetricsRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getStrikethroughPosition_ = call (load_sym libpango "pango_font_metrics_get_strikethrough_position") (PangoFontMetricsRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getStrikethroughThickness_ = call (load_sym libpango "pango_font_metrics_get_strikethrough_thickness") (PangoFontMetricsRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getUnderlinePosition_ = call (load_sym libpango "pango_font_metrics_get_underline_position") (PangoFontMetricsRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getUnderlineThickness_ = call (load_sym libpango "pango_font_metrics_get_underline_thickness") (PangoFontMetricsRecord.PolyML.cPtr --> GInt.PolyML.cVal)
    end
    type t = PangoFontMetricsRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getApproximateCharWidth self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt.FFI.fromVal) getApproximateCharWidth_ self
    fun getApproximateDigitWidth self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt.FFI.fromVal) getApproximateDigitWidth_ self
    fun getAscent self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt.FFI.fromVal) getAscent_ self
    fun getDescent self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt.FFI.fromVal) getDescent_ self
    fun getStrikethroughPosition self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt.FFI.fromVal) getStrikethroughPosition_ self
    fun getStrikethroughThickness self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt.FFI.fromVal) getStrikethroughThickness_ self
    fun getUnderlinePosition self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt.FFI.fromVal) getUnderlinePosition_ self
    fun getUnderlineThickness self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt.FFI.fromVal) getUnderlineThickness_ self
  end
