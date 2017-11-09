structure GtkPrintOperationResult :> GTK_PRINT_OPERATION_RESULT =
  struct
    datatype enum =
      ERROR
    | APPLY
    | CANCEL
    | IN_PROGRESS
    structure Enum =
      Enum(
        type enum = enum
        val null = ERROR
        val toInt =
          fn
            ERROR => 0
          | APPLY => 1
          | CANCEL => 2
          | IN_PROGRESS => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => ERROR
          | 1 => APPLY
          | 2 => CANCEL
          | 3 => IN_PROGRESS
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_print_operation_result_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
