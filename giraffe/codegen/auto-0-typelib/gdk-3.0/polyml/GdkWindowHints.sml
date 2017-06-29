structure GdkWindowHints :> GDK_WINDOW_HINTS =
  struct
    val POS = 0w1
    val MIN_SIZE = 0w2
    val MAX_SIZE = 0w4
    val BASE_SIZE = 0w8
    val ASPECT = 0w16
    val RESIZE_INC = 0w32
    val WIN_GRAVITY = 0w64
    val USER_POS = 0w128
    val USER_SIZE = 0w256
    val allFlags =
      [
        POS,
        MIN_SIZE,
        MAX_SIZE,
        BASE_SIZE,
        ASPECT,
        RESIZE_INC,
        WIN_GRAVITY,
        USER_POS,
        USER_SIZE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_window_hints_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
