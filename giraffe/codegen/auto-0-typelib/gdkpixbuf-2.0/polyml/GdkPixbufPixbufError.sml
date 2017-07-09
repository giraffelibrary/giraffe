structure GdkPixbufPixbufError :> GDK_PIXBUF_PIXBUF_ERROR =
  struct
    datatype enum =
      CORRUPT_IMAGE
    | INSUFFICIENT_MEMORY
    | BAD_OPTION
    | UNKNOWN_TYPE
    | UNSUPPORTED_OPERATION
    | FAILED
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
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => CORRUPT_IMAGE
          | 1 => INSUFFICIENT_MEMORY
          | 2 => BAD_OPTION
          | 3 => UNKNOWN_TYPE
          | 4 => UNSUPPORTED_OPERATION
          | 5 => FAILED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_pixbuf_error_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
          "gdk-pixbuf-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GdkPixbufPixbufError = GdkPixbufPixbufError.Error
