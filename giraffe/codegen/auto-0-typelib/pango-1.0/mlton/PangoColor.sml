structure PangoColor :>
  PANGO_COLOR
    where type record_t = PangoColorRecord.t =
  struct
    val getType_ = _import "pango_color_get_type" : unit -> GObjectType.C.val_;
    val copy_ = _import "pango_color_copy" : PangoColorRecord.C.notnull PangoColorRecord.C.p -> PangoColorRecord.C.notnull PangoColorRecord.C.p;
    val parse_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_pango_color_parse" :
              PangoColorRecord.C.notnull PangoColorRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "pango_color_to_string" : PangoColorRecord.C.notnull PangoColorRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type record_t = PangoColorRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (PangoColorRecord.C.withPtr ---> PangoColorRecord.C.fromPtr true) copy_ self
    fun parse self spec = (PangoColorRecord.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) parse_ (self & spec)
    fun toString self = (PangoColorRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
