structure GdkDragProtocol :>
  sig
    include GDK_DRAG_PROTOCOL
  end =
  struct
    datatype t =
      NONE
    | MOTIF
    | XDND
    | ROOTWIN
    | WIN32DROPFILES
    | OLE2
    | LOCAL
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NONE => f 0
          | MOTIF => f 1
          | XDND => f 2
          | ROOTWIN => f 3
          | WIN32DROPFILES => f 4
          | OLE2 => f 5
          | LOCAL => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => MOTIF
          | 2 => XDND
          | 3 => ROOTWIN
          | 4 => WIN32DROPFILES
          | 5 => OLE2
          | 6 => LOCAL
          | n => raise Value n
      end
    val getType_ = _import "gdk_drag_protocol_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NONE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
