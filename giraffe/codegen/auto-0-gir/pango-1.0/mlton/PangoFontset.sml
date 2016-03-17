structure PangoFontset :>
  PANGO_FONTSET
    where type 'a class = 'a PangoFontsetClass.class
    where type 'a font_class = 'a PangoFontClass.class
    where type font_metrics_t = PangoFontMetricsRecord.t =
  struct
    val getType_ = _import "pango_fontset_get_type" : unit -> GObjectType.C.val_;
    val getFont_ = fn x1 & x2 => (_import "pango_fontset_get_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getMetrics_ = _import "pango_fontset_get_metrics" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p;
    type 'a class = 'a PangoFontsetClass.class
    type 'a font_class = 'a PangoFontClass.class
    type font_metrics_t = PangoFontMetricsRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFont self wc = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> PangoFontClass.C.fromPtr true) getFont_ (self & wc)
    fun getMetrics self = (GObjectObjectClass.C.withPtr ---> PangoFontMetricsRecord.C.fromPtr true) getMetrics_ self
  end
