structure PangoFontMetrics :>
  PANGO_FONT_METRICS
    where type t = PangoFontMetricsRecord.t =
  struct
    val getType_ = _import "pango_font_metrics_get_type" : unit -> GObjectType.C.val_;
    val getApproximateCharWidth_ = _import "pango_font_metrics_get_approximate_char_width" : PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p -> FFI.Int32.C.val_;
    val getApproximateDigitWidth_ = _import "pango_font_metrics_get_approximate_digit_width" : PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p -> FFI.Int32.C.val_;
    val getAscent_ = _import "pango_font_metrics_get_ascent" : PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p -> FFI.Int32.C.val_;
    val getDescent_ = _import "pango_font_metrics_get_descent" : PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p -> FFI.Int32.C.val_;
    val getStrikethroughPosition_ = _import "pango_font_metrics_get_strikethrough_position" : PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p -> FFI.Int32.C.val_;
    val getStrikethroughThickness_ = _import "pango_font_metrics_get_strikethrough_thickness" : PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p -> FFI.Int32.C.val_;
    val getUnderlinePosition_ = _import "pango_font_metrics_get_underline_position" : PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p -> FFI.Int32.C.val_;
    val getUnderlineThickness_ = _import "pango_font_metrics_get_underline_thickness" : PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p -> FFI.Int32.C.val_;
    type t = PangoFontMetricsRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getApproximateCharWidth self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getApproximateCharWidth_ self
    fun getApproximateDigitWidth self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getApproximateDigitWidth_ self
    fun getAscent self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getAscent_ self
    fun getDescent self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getDescent_ self
    fun getStrikethroughPosition self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getStrikethroughPosition_ self
    fun getStrikethroughThickness self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getStrikethroughThickness_ self
    fun getUnderlinePosition self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getUnderlinePosition_ self
    fun getUnderlineThickness self = (PangoFontMetricsRecord.C.withPtr ---> FFI.Int32.C.fromVal) getUnderlineThickness_ self
  end
