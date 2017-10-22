structure GdkAnchorHints :> GDK_ANCHOR_HINTS =
  struct
    val FLIP_X = 0w1
    val FLIP_Y = 0w2
    val SLIDE_X = 0w4
    val SLIDE_Y = 0w8
    val RESIZE_X = 0w16
    val RESIZE_Y = 0w32
    val FLIP = 0w3
    val SLIDE = 0w12
    val RESIZE = 0w48
    val allFlags =
      [
        FLIP_X,
        FLIP_Y,
        SLIDE_X,
        SLIDE_Y,
        RESIZE_X,
        RESIZE_Y,
        FLIP,
        SLIDE,
        RESIZE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_anchor_hints_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
