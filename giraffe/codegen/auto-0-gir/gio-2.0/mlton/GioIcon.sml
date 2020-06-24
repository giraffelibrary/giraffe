structure GioIcon :>
  GIO_ICON
    where type 'a class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_icon_get_type" : unit -> GObjectType.FFI.val_;
    val deserialize_ = _import "g_icon_deserialize" : GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val newForString_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_icon_new_for_string" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val equal_ = fn x1 & x2 => (_import "g_icon_equal" : GioIconClass.FFI.non_opt GioIconClass.FFI.p * GioIconClass.FFI.opt GioIconClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val serialize_ = _import "g_icon_serialize" : GioIconClass.FFI.non_opt GioIconClass.FFI.p -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
    val toString_ = _import "g_icon_to_string" : GioIconClass.FFI.non_opt GioIconClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    type 'a class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun deserialize value = (GLibVariantRecord.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) deserialize_ value
    fun newForString str = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioIconClass.FFI.fromPtr true) newForString_ (str & [])
    fun equal self icon2 = (GioIconClass.FFI.withPtr &&&> GioIconClass.FFI.withOptPtr ---> GBool.FFI.fromVal) equal_ (self & icon2)
    fun serialize self = (GioIconClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr true) serialize_ self
    fun toString self = (GioIconClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) toString_ self
  end
