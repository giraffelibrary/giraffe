structure GdkWindowEdge :> GDK_WINDOW_EDGE =
  struct
    datatype enum =
      NORTH_WEST
    | NORTH
    | NORTH_EAST
    | WEST
    | EAST
    | SOUTH_WEST
    | SOUTH
    | SOUTH_EAST
    structure Enum =
      Enum(
        type enum = enum
        val null = NORTH_WEST
        val toInt =
          fn
            NORTH_WEST => 0
          | NORTH => 1
          | NORTH_EAST => 2
          | WEST => 3
          | EAST => 4
          | SOUTH_WEST => 5
          | SOUTH => 6
          | SOUTH_EAST => 7
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NORTH_WEST
          | 1 => NORTH
          | 2 => NORTH_EAST
          | 3 => WEST
          | 4 => EAST
          | 5 => SOUTH_WEST
          | 6 => SOUTH
          | 7 => SOUTH_EAST
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_window_edge_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
