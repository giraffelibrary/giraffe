structure GioIcon :>
  GIO_ICON
    where type 'a class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_icon_get_type" : unit -> GObjectType.C.val_;
    val newForString_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_icon_new_for_string" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GioIconClass.C.notnull GioIconClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val equal_ = fn x1 & x2 => (_import "g_icon_equal" : GioIconClass.C.notnull GioIconClass.C.p * GioIconClass.C.notnull GioIconClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val toString_ = _import "g_icon_to_string" : GioIconClass.C.notnull GioIconClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type 'a class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForString str = (Utf8.C.withPtr &&&> GLibErrorRecord.handleError ---> GioIconClass.C.fromPtr true) newForString_ (str & [])
    fun equal self icon2 = (GioIconClass.C.withPtr &&&> GioIconClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & icon2)
    fun toString self = (GioIconClass.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
