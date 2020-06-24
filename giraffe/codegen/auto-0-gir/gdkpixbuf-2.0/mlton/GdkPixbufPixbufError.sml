structure GdkPixbufPixbufError :> GDK_PIXBUF_PIXBUF_ERROR =
  struct
    datatype enum =
      CORRUPT_IMAGE
    | INSUFFICIENT_MEMORY
    | BAD_OPTION
    | UNKNOWN_TYPE
    | UNSUPPORTED_OPERATION
    | FAILED
    | INCOMPLETE_ANIMATION
    structure Enum =
      Enum(
        type enum = enum
        val null = CORRUPT_IMAGE
        val toInt =
          fn
            CORRUPT_IMAGE => 0
          | INSUFFICIENT_MEMORY => 1
          | BAD_OPTION => 2
          | UNKNOWN_TYPE => 3
          | UNSUPPORTED_OPERATION => 4
          | FAILED => 5
          | INCOMPLETE_ANIMATION => 6
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CORRUPT_IMAGE
          | 1 => INSUFFICIENT_MEMORY
          | 2 => BAD_OPTION
          | 3 => UNKNOWN_TYPE
          | 4 => UNSUPPORTED_OPERATION
          | 5 => FAILED
          | 6 => INCOMPLETE_ANIMATION
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gdk_pixbuf_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
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
          "gdk-pixbuf-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GdkPixbufPixbufError = GdkPixbufPixbufError.Error
