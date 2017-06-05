structure PangoFontMetrics :>
  PANGO_FONT_METRICS
    where type t = PangoFontMetricsRecord.t =
  struct
    val getType_ = _import "pango_font_metrics_get_type" : unit -> GObjectType.FFI.val_;
    val getApproximateCharWidth_ = _import "pango_font_metrics_get_approximate_char_width" : PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p -> GInt32.FFI.val_;
    val getApproximateDigitWidth_ = _import "pango_font_metrics_get_approximate_digit_width" : PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p -> GInt32.FFI.val_;
    val getAscent_ = _import "pango_font_metrics_get_ascent" : PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p -> GInt32.FFI.val_;
    val getDescent_ = _import "pango_font_metrics_get_descent" : PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p -> GInt32.FFI.val_;
    val getStrikethroughPosition_ = _import "pango_font_metrics_get_strikethrough_position" : PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p -> GInt32.FFI.val_;
    val getStrikethroughThickness_ = _import "pango_font_metrics_get_strikethrough_thickness" : PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p -> GInt32.FFI.val_;
    val getUnderlinePosition_ = _import "pango_font_metrics_get_underline_position" : PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p -> GInt32.FFI.val_;
    val getUnderlineThickness_ = _import "pango_font_metrics_get_underline_thickness" : PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p -> GInt32.FFI.val_;
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
