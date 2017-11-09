structure GtkRecentChooserError :> GTK_RECENT_CHOOSER_ERROR =
  struct
    datatype enum =
      NOT_FOUND
    | INVALID_URI
    structure Enum =
      Enum(
        type enum = enum
        val null = NOT_FOUND
        val toInt =
          fn
            NOT_FOUND => 0
          | INVALID_URI => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NOT_FOUND
          | 1 => INVALID_URI
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_chooser_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "gtk-recent-chooser-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkRecentChooserError = GtkRecentChooserError.Error
