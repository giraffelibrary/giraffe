structure GdkWMDecoration :> GDK_W_M_DECORATION =
  struct
    val ALL = 0w1
    val BORDER = 0w2
    val RESIZEH = 0w4
    val TITLE = 0w8
    val MENU = 0w16
    val MINIMIZE = 0w32
    val MAXIMIZE = 0w64
    val allFlags =
      [
        ALL,
        BORDER,
        RESIZEH,
        TITLE,
        MENU,
        MINIMIZE,
        MAXIMIZE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_wm_decoration_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
