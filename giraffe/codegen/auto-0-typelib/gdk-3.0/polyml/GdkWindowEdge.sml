structure GdkWindowEdge :>
  sig
    include GDK_WINDOW_EDGE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      NORTH_WEST
    | NORTH
    | NORTH_EAST
    | WEST
    | EAST
    | SOUTH_WEST
    | SOUTH
    | SOUTH_EAST
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NORTH_WEST => f 0
          | NORTH => f 1
          | NORTH_EAST => f 2
          | WEST => f 3
          | EAST => f 4
          | SOUTH_WEST => f 5
          | SOUTH => f 6
          | SOUTH_EAST => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_window_edge_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NORTH_WEST
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
