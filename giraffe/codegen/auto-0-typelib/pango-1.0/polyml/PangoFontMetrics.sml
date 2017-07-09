structure PangoFontMetrics :>
  PANGO_FONT_METRICS
    where type t = PangoFontMetricsRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_font_metrics_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getApproximateCharWidth_ = call (getSymbol "pango_font_metrics_get_approximate_char_width") (PangoFontMetricsRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getApproximateDigitWidth_ = call (getSymbol "pango_font_metrics_get_approximate_digit_width") (PangoFontMetricsRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getAscent_ = call (getSymbol "pango_font_metrics_get_ascent") (PangoFontMetricsRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getDescent_ = call (getSymbol "pango_font_metrics_get_descent") (PangoFontMetricsRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getStrikethroughPosition_ = call (getSymbol "pango_font_metrics_get_strikethrough_position") (PangoFontMetricsRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getStrikethroughThickness_ = call (getSymbol "pango_font_metrics_get_strikethrough_thickness") (PangoFontMetricsRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getUnderlinePosition_ = call (getSymbol "pango_font_metrics_get_underline_position") (PangoFontMetricsRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getUnderlineThickness_ = call (getSymbol "pango_font_metrics_get_underline_thickness") (PangoFontMetricsRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
    end
    type t = PangoFontMetricsRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getApproximateCharWidth self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getApproximateCharWidth_ self
    fun getApproximateDigitWidth self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getApproximateDigitWidth_ self
    fun getAscent self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getAscent_ self
    fun getDescent self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getDescent_ self
    fun getStrikethroughPosition self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getStrikethroughPosition_ self
    fun getStrikethroughThickness self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getStrikethroughThickness_ self
    fun getUnderlinePosition self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getUnderlinePosition_ self
    fun getUnderlineThickness self = (PangoFontMetricsRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getUnderlineThickness_ self
  end
