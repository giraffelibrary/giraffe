structure GdkRgba :>
  GDK_RGBA
    where type record_t = GdkRgbaRecord.t =
  struct
    val getType_ = _import "gdk_rgba_get_type" : unit -> GObjectType.C.val_;
    val copy_ = _import "gdk_rgba_copy" : GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p;
    val equal_ = fn x1 & x2 => (_import "gdk_rgba_equal" : GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val hash_ = _import "gdk_rgba_hash" : GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> FFI.UInt.C.val_;
    val parse_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_rgba_parse" :
              GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "gdk_rgba_to_string" : GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type record_t = GdkRgbaRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GdkRgbaRecord.C.withPtr ---> GdkRgbaRecord.C.fromPtr true) copy_ self
    fun equal self p2 = (GdkRgbaRecord.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & p2)
    fun hash self = (GdkRgbaRecord.C.withPtr ---> FFI.UInt.C.fromVal) hash_ self
    fun parse spec =
      let
        val rgba & retVal = (GdkRgbaRecord.C.withNewPtr &&&> Utf8.C.withConstPtr ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.C.fromVal) parse_ (() & spec)
      in
        if retVal then SOME rgba else NONE
      end
    fun toString self = (GdkRgbaRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
