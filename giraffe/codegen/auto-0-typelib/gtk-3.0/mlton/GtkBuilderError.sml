structure GtkBuilderError :> GTK_BUILDER_ERROR =
  struct
    datatype enum =
      INVALID_TYPE_FUNCTION
    | UNHANDLED_TAG
    | MISSING_ATTRIBUTE
    | INVALID_ATTRIBUTE
    | INVALID_TAG
    | MISSING_PROPERTY_VALUE
    | INVALID_VALUE
    | VERSION_MISMATCH
    | DUPLICATE_ID
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID_TYPE_FUNCTION
        val toInt =
          fn
            INVALID_TYPE_FUNCTION => 0
          | UNHANDLED_TAG => 1
          | MISSING_ATTRIBUTE => 2
          | INVALID_ATTRIBUTE => 3
          | INVALID_TAG => 4
          | MISSING_PROPERTY_VALUE => 5
          | INVALID_VALUE => 6
          | VERSION_MISMATCH => 7
          | DUPLICATE_ID => 8
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INVALID_TYPE_FUNCTION
          | 1 => UNHANDLED_TAG
          | 2 => MISSING_ATTRIBUTE
          | 3 => INVALID_ATTRIBUTE
          | 4 => INVALID_TAG
          | 5 => MISSING_PROPERTY_VALUE
          | 6 => INVALID_VALUE
          | 7 => VERSION_MISMATCH
          | 8 => DUPLICATE_ID
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_builder_error_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
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
          "gtk-builder-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GtkBuilderError = GtkBuilderError.Error
