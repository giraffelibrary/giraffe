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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_seat_capabilities_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
