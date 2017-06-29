structure GtkRecentManagerError :> GTK_RECENT_MANAGER_ERROR =
  struct
    datatype enum =
      NOT_FOUND
    | INVALID_URI
    | INVALID_ENCODING
    | NOT_REGISTERED
    | READ
    | WRITE
    | UNKNOWN
    structure Enum =
      Enum(
        type enum = enum
        val null = NOT_FOUND
        val toInt =
          fn
            NOT_FOUND => 0
          | INVALID_URI => 1
          | INVALID_ENCODING => 2
          | NOT_REGISTERED => 3
          | READ => 4
          | WRITE => 5
          | UNKNOWN => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NOT_FOUND
          | 1 => INVALID_URI
          | 2 => INVALID_ENCODING
          | 3 => NOT_REGISTERED
          | 4 => READ
          | 5 => WRITE
          | 6 => UNKNOWN
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_manager_error_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
          "gtk-recent-manager-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkRecentManagerError = GtkRecentManagerError.Error
