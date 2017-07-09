structure PangoFontMask :> PANGO_FONT_MASK =
  struct
    val FAMILY = 0w1
    val STYLE = 0w2
    val VARIANT = 0w4
    val WEIGHT = 0w8
    val STRETCH = 0w16
    val SIZE = 0w32
    val GRAVITY = 0w64
    val allFlags =
      [
        FAMILY,
        STYLE,
        VARIANT,
        WEIGHT,
        STRETCH,
        SIZE,
        GRAVITY
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_font_mask_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
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
