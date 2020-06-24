structure GtkSortType :> GTK_SORT_TYPE =
  struct
    datatype enum =
      ASCENDING
    | DESCENDING
    structure Enum =
      Enum(
        type enum = enum
        val null = ASCENDING
        val toInt =
          fn
            ASCENDING => 0
          | DESCENDING => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => ASCENDING
          | 1 => DESCENDING
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_sort_type_get_type" : unit -> GObjectType.FFI.val_;
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
