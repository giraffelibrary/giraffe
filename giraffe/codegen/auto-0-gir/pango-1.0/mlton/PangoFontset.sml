structure PangoFontset :>
  PANGO_FONTSET
    where type 'a class = 'a PangoFontsetClass.class
    where type 'a font_class = 'a PangoFontClass.class
    where type font_metrics_t = PangoFontMetricsRecord.t =
  struct
    val getType_ = _import "pango_fontset_get_type" : unit -> GObjectType.C.val_;
    val getFont_ = fn x1 & x2 => (_import "pango_fontset_get_font" : PangoFontsetClass.C.notnull PangoFontsetClass.C.p * FFI.UInt.C.val_ -> PangoFontClass.C.notnull PangoFontClass.C.p;) (x1, x2)
    val getMetrics_ = _import "pango_fontset_get_metrics" : PangoFontsetClass.C.notnull PangoFontsetClass.C.p -> PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p;
    type 'a class = 'a PangoFontsetClass.class
    type 'a font_class = 'a PangoFontClass.class
    type font_metrics_t = PangoFontMetricsRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFont self wc = (PangoFontsetClass.C.withPtr &&&> FFI.UInt.C.withVal ---> PangoFontClass.C.fromPtr true) getFont_ (self & wc)
    fun getMetrics self = (PangoFontsetClass.C.withPtr ---> PangoFontMetricsRecord.C.fromPtr true) getMetrics_ self
  end
