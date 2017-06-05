structure PangoColor :>
  PANGO_COLOR
    where type t = PangoColorRecord.t =
  struct
    val getType_ = _import "pango_color_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "pango_color_copy" : PangoColorRecord.FFI.notnull PangoColorRecord.FFI.p -> PangoColorRecord.FFI.notnull PangoColorRecord.FFI.p;
    val parse_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_pango_color_parse" :
              PangoColorRecord.FFI.notnull PangoColorRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "pango_color_to_string" : PangoColorRecord.FFI.notnull PangoColorRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    type t = PangoColorRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (PangoColorRecord.FFI.withPtr ---> PangoColorRecord.FFI.fromPtr true) copy_ self
    fun parse self spec = (PangoColorRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) parse_ (self & spec)
    fun toString self = (PangoColorRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
