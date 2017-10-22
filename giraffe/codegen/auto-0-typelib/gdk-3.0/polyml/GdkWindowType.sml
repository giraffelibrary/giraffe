structure GdkWindowType :> GDK_WINDOW_TYPE =
  struct
    datatype enum =
      ROOT
    | TOPLEVEL
    | CHILD
    | TEMP
    | FOREIGN
    | OFFSCREEN
    | SUBSURFACE
    structure Enum =
      Enum(
        type enum = enum
        val null = ROOT
        val toInt =
          fn
            ROOT => 0
          | TOPLEVEL => 1
          | CHILD => 2
          | TEMP => 3
          | FOREIGN => 4
          | OFFSCREEN => 5
          | SUBSURFACE => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ROOT
          | 1 => TOPLEVEL
          | 2 => CHILD
          | 3 => TEMP
          | 4 => FOREIGN
          | 5 => OFFSCREEN
          | 6 => SUBSURFACE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_window_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
