structure GtkSourceChangeCaseType :> GTK_SOURCE_CHANGE_CASE_TYPE =
  struct
    datatype enum =
      LOWER
    | UPPER
    | TOGGLE
    | TITLE
    structure Enum =
      Enum(
        type enum = enum
        val null = LOWER
        val toInt =
          fn
            LOWER => 0
          | UPPER => 1
          | TOGGLE => 2
          | TITLE => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => LOWER
          | 1 => UPPER
          | 2 => TOGGLE
          | 3 => TITLE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_source_change_case_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
