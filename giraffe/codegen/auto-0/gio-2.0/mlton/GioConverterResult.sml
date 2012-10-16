structure GioConverterResult :>
  sig
    include GIO_CONVERTER_RESULT
  end =
  struct
    datatype t =
      ERROR
    | CONVERTED
    | FINISHED
    | FLUSHED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            ERROR => f 0
          | CONVERTED => f 1
          | FINISHED => f 2
          | FLUSHED => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => ERROR
          | 1 => CONVERTED
          | 2 => FINISHED
          | 3 => FLUSHED
          | n => raise Value n
      end
    val getType_ = _import "g_converter_result_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = ERROR
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
