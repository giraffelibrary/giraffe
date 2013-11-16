structure GdkGravity :>
  sig
    include GDK_GRAVITY
  end =
  struct
    datatype t =
      NORTHWEST
    | NORTH
    | NORTHEAST
    | WEST
    | CENTER
    | EAST
    | SOUTHWEST
    | SOUTH
    | SOUTHEAST
    | STATIC
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NORTHWEST => f 1
          | NORTH => f 2
          | NORTHEAST => f 3
          | WEST => f 4
          | CENTER => f 5
          | EAST => f 6
          | SOUTHWEST => f 7
          | SOUTH => f 8
          | SOUTHEAST => f 9
          | STATIC => f 10
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            1 => NORTHWEST
          | 2 => NORTH
          | 3 => NORTHEAST
          | 4 => WEST
          | 5 => CENTER
          | 6 => EAST
          | 7 => SOUTHWEST
          | 8 => SOUTH
          | 9 => SOUTHEAST
          | 10 => STATIC
          | n => raise Value n
      end
    val getType_ = _import "gdk_gravity_get_type" : unit -> GObjectType.C.val_;
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
