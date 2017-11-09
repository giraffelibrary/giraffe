structure GtkPackType :> GTK_PACK_TYPE =
  struct
    datatype enum =
      START
    | END
    structure Enum =
      Enum(
        type enum = enum
        val null = START
        val toInt =
          fn
            START => 0
          | END => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => START
          | 1 => END
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_pack_type_get_type" : unit -> GObjectType.FFI.val_;
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
