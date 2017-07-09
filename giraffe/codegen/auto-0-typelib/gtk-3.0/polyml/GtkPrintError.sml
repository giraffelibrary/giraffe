structure GtkPrintError :> GTK_PRINT_ERROR =
  struct
    datatype enum =
      GENERAL
    | INTERNAL_ERROR
    | NOMEM
    | INVALID_FILE
    structure Enum =
      Enum(
        type enum = enum
        val null = GENERAL
        val toInt =
          fn
            GENERAL => 0
          | INTERNAL_ERROR => 1
          | NOMEM => 2
          | INVALID_FILE => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => GENERAL
          | 1 => INTERNAL_ERROR
          | 2 => NOMEM
          | 3 => INVALID_FILE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_print_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "gtk-print-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkPrintError = GtkPrintError.Error
