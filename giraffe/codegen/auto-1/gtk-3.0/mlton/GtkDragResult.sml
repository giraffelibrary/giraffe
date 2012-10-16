structure GtkDragResult :>
  sig
    include GTK_DRAG_RESULT
  end =
  struct
    datatype t =
      SUCCESS
    | NOTARGET
    | USERCANCELLED
    | TIMEOUTEXPIRED
    | GRABBROKEN
    | ERROR
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            SUCCESS => f 0
          | NOTARGET => f 1
          | USERCANCELLED => f 2
          | TIMEOUTEXPIRED => f 3
          | GRABBROKEN => f 4
          | ERROR => f 5
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => SUCCESS
          | 1 => NOTARGET
          | 2 => USERCANCELLED
          | 3 => TIMEOUTEXPIRED
          | 4 => GRABBROKEN
          | 5 => ERROR
          | n => raise Value n
      end
    val getType_ = _import "gtk_drag_result_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = SUCCESS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
