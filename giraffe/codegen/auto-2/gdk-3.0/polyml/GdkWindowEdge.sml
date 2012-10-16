structure GdkWindowEdge :>
  sig
    include GDK_WINDOW_EDGE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      NORTHWEST
    | NORTH
    | NORTHEAST
    | WEST
    | EAST
    | SOUTHWEST
    | SOUTH
    | SOUTHEAST
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NORTHWEST => f 0
          | NORTH => f 1
          | NORTHEAST => f 2
          | WEST => f 3
          | EAST => f 4
          | SOUTHWEST => f 5
          | SOUTH => f 6
          | SOUTHEAST => f 7
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NORTHWEST
          | 1 => NORTH
          | 2 => NORTHEAST
          | 3 => WEST
          | 4 => EAST
          | 5 => SOUTHWEST
          | 6 => SOUTH
          | 7 => SOUTHEAST
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_window_edge_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NORTHWEST
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
