structure GioEmblemOrigin :> GIO_EMBLEM_ORIGIN =
  struct
    datatype enum =
      UNKNOWN
    | DEVICE
    | LIVEMETADATA
    | TAG
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | DEVICE => 1
          | LIVEMETADATA => 2
          | TAG => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UNKNOWN
          | 1 => DEVICE
          | 2 => LIVEMETADATA
          | 3 => TAG
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_emblem_origin_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
