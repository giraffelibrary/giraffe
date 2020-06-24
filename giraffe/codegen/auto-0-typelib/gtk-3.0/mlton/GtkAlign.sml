structure GtkAlign :> GTK_ALIGN =
  struct
    datatype enum =
      FILL
    | START
    | END
    | CENTER
    | BASELINE
    structure Enum =
      Enum(
        type enum = enum
        val null = FILL
        val toInt =
          fn
            FILL => 0
          | START => 1
          | END => 2
          | CENTER => 3
          | BASELINE => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => FILL
          | 1 => START
          | 2 => END
          | 3 => CENTER
          | 4 => BASELINE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_align_get_type" : unit -> GObjectType.FFI.val_;
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
