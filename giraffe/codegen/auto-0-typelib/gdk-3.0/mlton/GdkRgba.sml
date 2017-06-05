structure GdkRgba :>
  GDK_RGBA
    where type t = GdkRgbaRecord.t =
  struct
    val getType_ = _import "gdk_rgba_get_type" : unit -> GObjectType.FFI.val_;
    val copy_ = _import "gdk_rgba_copy" : GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p;
    val equal_ = fn x1 & x2 => (_import "gdk_rgba_equal" : GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val hash_ = _import "gdk_rgba_hash" : GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> GUInt32.FFI.val_;
    val parse_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_rgba_parse" :
              GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "gdk_rgba_to_string" : GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    type t = GdkRgbaRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GdkRgbaRecord.FFI.withPtr ---> GdkRgbaRecord.FFI.fromPtr true) copy_ self
    fun equal self p2 = (GdkRgbaRecord.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & p2)
    fun hash self = (GdkRgbaRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) hash_ self
    fun parse self spec = (GdkRgbaRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) parse_ (self & spec)
    fun toString self = (GdkRgbaRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
