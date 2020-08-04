structure PangoColor :>
  PANGO_COLOR
    where type t = PangoColorRecord.t =
  struct
    val getType_ = _import "pango_color_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "pango_color_copy" : PangoColorRecord.FFI.non_opt PangoColorRecord.FFI.p -> PangoColorRecord.FFI.opt PangoColorRecord.FFI.p;
    val parse_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_pango_color_parse" :
              PangoColorRecord.FFI.non_opt PangoColorRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "pango_color_to_string" : PangoColorRecord.FFI.non_opt PangoColorRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    type t = PangoColorRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (PangoColorRecord.FFI.withPtr false ---> PangoColorRecord.FFI.fromOptPtr true) copy_ self
    fun parse self spec = (PangoColorRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) parse_ (self & spec)
    fun toString self = (PangoColorRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
  end
