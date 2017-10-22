structure GdkSubpixelLayout :> GDK_SUBPIXEL_LAYOUT =
  struct
    datatype enum =
      UNKNOWN
    | NONE
    | HORIZONTAL_RGB
    | HORIZONTAL_BGR
    | VERTICAL_RGB
    | VERTICAL_BGR
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | NONE => 1
          | HORIZONTAL_RGB => 2
          | HORIZONTAL_BGR => 3
          | VERTICAL_RGB => 4
          | VERTICAL_BGR => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => UNKNOWN
          | 1 => NONE
          | 2 => HORIZONTAL_RGB
          | 3 => HORIZONTAL_BGR
          | 4 => VERTICAL_RGB
          | 5 => VERTICAL_BGR
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_subpixel_layout_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
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
