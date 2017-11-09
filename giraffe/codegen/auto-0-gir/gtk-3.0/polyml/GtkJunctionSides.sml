structure GtkJunctionSides :> GTK_JUNCTION_SIDES =
  struct
    local
      fun NONE () = 0w0
    in
      val NONE = NONE ()
    end
    val CORNER_TOPLEFT = 0w1
    val CORNER_TOPRIGHT = 0w2
    val CORNER_BOTTOMLEFT = 0w4
    val CORNER_BOTTOMRIGHT = 0w8
    val TOP = 0w3
    val BOTTOM = 0w12
    val LEFT = 0w5
    val RIGHT = 0w10
    val allFlags =
      [
        NONE,
        CORNER_TOPLEFT,
        CORNER_TOPRIGHT,
        CORNER_BOTTOMLEFT,
        CORNER_BOTTOMRIGHT,
        TOP,
        BOTTOM,
        LEFT,
        RIGHT
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_junction_sides_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
