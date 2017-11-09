structure GdkGravity :> GDK_GRAVITY =
  struct
    datatype enum =
      NORTH_WEST
    | NORTH
    | NORTH_EAST
    | WEST
    | CENTER
    | EAST
    | SOUTH_WEST
    | SOUTH
    | SOUTH_EAST
    | STATIC
    structure Enum =
      Enum(
        type enum = enum
        val null = NORTH_WEST
        val toInt =
          fn
            NORTH_WEST => 1
          | NORTH => 2
          | NORTH_EAST => 3
          | WEST => 4
          | CENTER => 5
          | EAST => 6
          | SOUTH_WEST => 7
          | SOUTH => 8
          | SOUTH_EAST => 9
          | STATIC => 10
        exception Value of GInt.t
        val fromInt =
          fn
            1 => NORTH_WEST
          | 2 => NORTH
          | 3 => NORTH_EAST
          | 4 => WEST
          | 5 => CENTER
          | 6 => EAST
          | 7 => SOUTH_WEST
          | 8 => SOUTH
          | 9 => SOUTH_EAST
          | 10 => STATIC
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_gravity_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
