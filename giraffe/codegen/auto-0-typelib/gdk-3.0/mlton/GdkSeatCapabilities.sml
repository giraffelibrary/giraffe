structure GdkSeatCapabilities :> GDK_SEAT_CAPABILITIES =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val POINTER = 0w1
    val TOUCH = 0w2
    val TABLET_STYLUS = 0w4
    val KEYBOARD = 0w8
    val ALL_POINTING = 0w7
    val ALL = 0w15
    val allFlags =
      [
        NONE,
        POINTER,
        TOUCH,
        TABLET_STYLUS,
        KEYBOARD,
        ALL_POINTING,
        ALL
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    val getType_ = _import "gdk_seat_capabilities_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_flags" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
