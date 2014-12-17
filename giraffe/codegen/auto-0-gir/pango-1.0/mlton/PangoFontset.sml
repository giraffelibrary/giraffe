structure PangoFontset :>
  PANGO_FONTSET
    where type 'a class_t = 'a PangoFontsetClass.t
    where type 'a fontclass_t = 'a PangoFontClass.t
    where type fontmetricsrecord_t = PangoFontMetricsRecord.t =
  struct
    val getType_ = _import "pango_fontset_get_type" : unit -> GObjectType.C.val_;
    val getFont_ = fn x1 & x2 => (_import "pango_fontset_get_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getMetrics_ = _import "pango_fontset_get_metrics" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoFontMetricsRecord.C.notnull PangoFontMetricsRecord.C.p;
    type 'a class_t = 'a PangoFontsetClass.t
    type 'a fontclass_t = 'a PangoFontClass.t
    type fontmetricsrecord_t = PangoFontMetricsRecord.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFont self wc = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> PangoFontClass.C.fromPtr true) getFont_ (self & wc)
    fun getMetrics self = (GObjectObjectClass.C.withPtr ---> PangoFontMetricsRecord.C.fromPtr true) getMetrics_ self
  end
