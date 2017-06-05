structure PangoFontset :>
  PANGO_FONTSET
    where type 'a class = 'a PangoFontsetClass.class
    where type 'a font_class = 'a PangoFontClass.class
    where type font_metrics_t = PangoFontMetricsRecord.t =
  struct
    val getType_ = _import "pango_fontset_get_type" : unit -> GObjectType.FFI.val_;
    val getFont_ = fn x1 & x2 => (_import "pango_fontset_get_font" : PangoFontsetClass.FFI.notnull PangoFontsetClass.FFI.p * GUInt.FFI.val_ -> PangoFontClass.FFI.notnull PangoFontClass.FFI.p;) (x1, x2)
    val getMetrics_ = _import "pango_fontset_get_metrics" : PangoFontsetClass.FFI.notnull PangoFontsetClass.FFI.p -> PangoFontMetricsRecord.FFI.notnull PangoFontMetricsRecord.FFI.p;
    type 'a class = 'a PangoFontsetClass.class
    type 'a font_class = 'a PangoFontClass.class
    type font_metrics_t = PangoFontMetricsRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFont self wc = (PangoFontsetClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> PangoFontClass.FFI.fromPtr true) getFont_ (self & wc)
    fun getMetrics self = (PangoFontsetClass.FFI.withPtr ---> PangoFontMetricsRecord.FFI.fromPtr true) getMetrics_ self
  end
