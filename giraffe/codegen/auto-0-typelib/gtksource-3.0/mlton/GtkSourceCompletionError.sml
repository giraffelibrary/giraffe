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
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ALREADY_BOUND
          | 1 => NOT_BOUND
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_source_completion_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
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
          "gtk-source-completion-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkSourceCompletionError = GtkSourceCompletionError.Error
