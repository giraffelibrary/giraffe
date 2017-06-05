structure GtkSourceCompletionError :> GTK_SOURCE_COMPLETION_ERROR =
  struct
    datatype enum =
      ALREADY_BOUND
    | NOT_BOUND
    structure Enum =
      Enum(
        type enum = enum
        val null = ALREADY_BOUND
        val toInt =
          fn
            ALREADY_BOUND => 0
          | NOT_BOUND => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => ALREADY_BOUND
          | 1 => NOT_BOUND
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_completion_error_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "gtk-source-completion-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkSourceCompletionError = GtkSourceCompletionError.Error
