structure GdkColor :>
  GDK_COLOR
    where type record_t = GdkColorRecord.t =
  struct
    val getType_ = _import "gdk_color_get_type" : unit -> GObjectType.C.val_;
    val copy_ = _import "gdk_color_copy" : GdkColorRecord.C.notnull GdkColorRecord.C.p -> GdkColorRecord.C.notnull GdkColorRecord.C.p;
    val equal_ = fn x1 & x2 => (_import "gdk_color_equal" : GdkColorRecord.C.notnull GdkColorRecord.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val hash_ = _import "gdk_color_hash" : GdkColorRecord.C.notnull GdkColorRecord.C.p -> FFI.UInt32.C.val_;
    val toString_ = _import "gdk_color_to_string" : GdkColorRecord.C.notnull GdkColorRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val parse_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gdk_color_parse" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GdkColorRecord.C.notnull GdkColorRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type record_t = GdkColorRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GdkColorRecord.C.withPtr ---> GdkColorRecord.C.fromPtr true) copy_ self
    fun equal self colorb = (GdkColorRecord.C.withPtr &&&> GdkColorRecord.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & colorb)
    fun hash self = (GdkColorRecord.C.withPtr ---> FFI.UInt32.C.fromVal) hash_ self
    fun toString self = (GdkColorRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
    fun parse spec =
      let
        val color & retVal = (Utf8.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && FFI.Bool.C.fromVal) parse_ (spec & ())
      in
        if retVal then SOME color else NONE
      end
  end
