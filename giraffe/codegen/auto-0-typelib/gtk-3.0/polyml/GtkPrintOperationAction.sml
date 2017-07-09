structure GtkPrintOperationAction :> GTK_PRINT_OPERATION_ACTION =
  struct
    datatype enum =
      PRINT_DIALOG
    | PRINT
    | PREVIEW
    | EXPORT
    structure Enum =
      Enum(
        type enum = enum
        val null = PRINT_DIALOG
        val toInt =
          fn
            PRINT_DIALOG => 0
          | PRINT => 1
          | PREVIEW => 2
          | EXPORT => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => PRINT_DIALOG
          | 1 => PRINT
          | 2 => PREVIEW
          | 3 => EXPORT
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_print_operation_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
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
