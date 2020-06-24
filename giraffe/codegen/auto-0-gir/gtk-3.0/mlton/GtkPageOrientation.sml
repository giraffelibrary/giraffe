structure GtkPageOrientation :> GTK_PAGE_ORIENTATION =
  struct
    datatype enum =
      PORTRAIT
    | LANDSCAPE
    | REVERSE_PORTRAIT
    | REVERSE_LANDSCAPE
    structure Enum =
      Enum(
        type enum = enum
        val null = PORTRAIT
        val toInt =
          fn
            PORTRAIT => 0
          | LANDSCAPE => 1
          | REVERSE_PORTRAIT => 2
          | REVERSE_LANDSCAPE => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => PORTRAIT
          | 1 => LANDSCAPE
          | 2 => REVERSE_PORTRAIT
          | 3 => REVERSE_LANDSCAPE
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_page_orientation_get_type" : unit -> GObjectType.FFI.val_;
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
