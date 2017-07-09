structure GtkCssProviderError :> GTK_CSS_PROVIDER_ERROR =
  struct
    datatype enum =
      FAILED
    | SYNTAX
    | IMPORT
    | NAME
    | DEPRECATED
    | UNKNOWN_VALUE
    structure Enum =
      Enum(
        type enum = enum
        val null = FAILED
        val toInt =
          fn
            FAILED => 0
          | SYNTAX => 1
          | IMPORT => 2
          | NAME => 3
          | DEPRECATED => 4
          | UNKNOWN_VALUE => 5
        exception Value of GInt.t
        val fromInt =
          fn
            0 => FAILED
          | 1 => SYNTAX
          | 2 => IMPORT
          | 3 => NAME
          | 4 => DEPRECATED
          | 5 => UNKNOWN_VALUE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_css_provider_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
          "gtk-css-provider-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkCssProviderError = GtkCssProviderError.Error
