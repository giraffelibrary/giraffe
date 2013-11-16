structure GdkWindowEdge :>
  sig
    include GDK_WINDOW_EDGE
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
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
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
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
    val getType_ = _import "gdk_window_edge_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
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
