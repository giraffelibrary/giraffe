structure GdkColor :>
  GDK_COLOR
    where type t = GdkColorRecord.t =
  struct
    val getType_ = _import "gdk_color_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gdk_color_copy" : GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p;
    val equal_ = fn x1 & x2 => (_import "gdk_color_equal" : GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val hash_ = _import "gdk_color_hash" : GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> GUInt32.FFI.val_;
    val toString_ = _import "gdk_color_to_string" : GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val parse_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_color_parse" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GdkColorRecord.FFI.non_opt GdkColorRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GdkColorRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GdkColorRecord.FFI.withPtr ---> GdkColorRecord.FFI.fromPtr true) copy_ self
    fun equal self colorb = (GdkColorRecord.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & colorb)
    fun hash self = (GdkColorRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) hash_ self
    fun toString self = (GdkColorRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
    fun parse spec =
      let
        val color & retVal = (Utf8.FFI.withPtr &&&> GdkColorRecord.FFI.withNewPtr ---> GdkColorRecord.FFI.fromPtr true && GBool.FFI.fromVal) parse_ (spec & ())
      in
        if retVal then SOME color else NONE
      end
  end
