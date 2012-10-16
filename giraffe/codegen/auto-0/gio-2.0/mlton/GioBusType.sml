structure GioBusType :>
  sig
    include GIO_BUS_TYPE
  end =
  struct
    datatype t =
      STARTER
    | NONE
    | SYSTEM
    | SESSION
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            STARTER => f ~1
          | NONE => f 0
          | SYSTEM => f 1
          | SESSION => f 2
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            ~1 => STARTER
          | 0 => NONE
          | 1 => SYSTEM
          | 2 => SESSION
          | n => raise Value n
      end
    val getType_ = _import "g_bus_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = STARTER
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
