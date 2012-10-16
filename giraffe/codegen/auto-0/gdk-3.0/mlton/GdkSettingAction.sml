structure GdkSettingAction :>
  sig
    include GDK_SETTING_ACTION
  end =
  struct
    datatype t =
      NEW
    | CHANGED
    | DELETED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NEW => f 0
          | CHANGED => f 1
          | DELETED => f 2
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NEW
          | 1 => CHANGED
          | 2 => DELETED
          | n => raise Value n
      end
    val getType_ = _import "gdk_setting_action_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NEW
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
