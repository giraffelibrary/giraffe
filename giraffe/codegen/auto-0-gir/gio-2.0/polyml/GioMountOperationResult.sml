structure GioMountOperationResult :> GIO_MOUNT_OPERATION_RESULT =
  struct
    datatype enum =
      HANDLED
    | ABORTED
    | UNHANDLED
    structure Enum =
      Enum(
        type enum = enum
        val null = HANDLED
        val toInt =
          fn
            HANDLED => 0
          | ABORTED => 1
          | UNHANDLED => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => HANDLED
          | 1 => ABORTED
          | 2 => UNHANDLED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_mount_operation_result_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
