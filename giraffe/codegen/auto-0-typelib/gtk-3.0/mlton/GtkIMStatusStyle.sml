structure GtkIMStatusStyle :> GTK_I_M_STATUS_STYLE =
  struct
    datatype enum =
      NOTHING
    | CALLBACK
    | NONE
    structure Enum =
      Enum(
        type enum = enum
        val null = NOTHING
        val toInt =
          fn
            NOTHING => 0
          | CALLBACK => 1
          | NONE => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NOTHING
          | 1 => CALLBACK
          | 2 => NONE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_im_status_style_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
