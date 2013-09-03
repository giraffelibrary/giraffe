structure GioIcon :>
  GIO_ICON
    where type 'a class_t = 'a GioIconClass.t =
  struct
    val getType_ = _import "g_icon_get_type" : unit -> GObjectType.C.val_;
    val hash_ = _import "g_icon_hash" : unit -> FFI.UInt32.val_;
    val newForString_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_icon_new_for_string" :
              cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val equal_ = fn x1 & x2 => (_import "g_icon_equal" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;) (x1, x2)
    val toString_ = _import "g_icon_to_string" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    type 'a class_t = 'a GioIconClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun hash () = (I ---> FFI.UInt32.fromVal) hash_ ()
    fun newForString str = (FFI.String.withConstPtr &&&> GLibErrorRecord.C.handleError ---> GioIconClass.C.fromPtr true) newForString_ (str & [])
    fun equal self icon2 = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & icon2)
    fun toString self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) toString_ self
  end
