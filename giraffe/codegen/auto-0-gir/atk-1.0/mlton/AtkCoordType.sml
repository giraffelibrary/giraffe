structure AtkCoordType :> ATK_COORD_TYPE =
  struct
    datatype enum =
      SCREEN
    | WINDOW
    structure Enum =
      Enum(
        type enum = enum
        val null = SCREEN
        val toInt =
          fn
            SCREEN => 0
          | WINDOW => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => SCREEN
          | 1 => WINDOW
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "atk_coord_type_get_type" : unit -> GObjectType.FFI.val_;
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
