structure GdkWMFunction :> GDK_W_M_FUNCTION =
  struct
    val ALL = 0w1
    val RESIZE = 0w2
    val MOVE = 0w4
    val MINIMIZE = 0w8
    val MAXIMIZE = 0w16
    val CLOSE = 0w32
    val allFlags =
      [
        ALL,
        RESIZE,
        MOVE,
        MINIMIZE,
        MAXIMIZE,
        CLOSE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_wm_function_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
