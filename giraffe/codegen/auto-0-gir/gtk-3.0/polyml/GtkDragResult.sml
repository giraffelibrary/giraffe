structure GtkDragResult :>
  sig
    include GTK_DRAG_RESULT
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      SUCCESS
    | NO_TARGET
    | USER_CANCELLED
    | TIMEOUT_EXPIRED
    | GRAB_BROKEN
    | ERROR
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            SUCCESS => f 0
          | NO_TARGET => f 1
          | USER_CANCELLED => f 2
          | TIMEOUT_EXPIRED => f 3
          | GRAB_BROKEN => f 4
          | ERROR => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => SUCCESS
          | 1 => NO_TARGET
          | 2 => USER_CANCELLED
          | 3 => TIMEOUT_EXPIRED
          | 4 => GRAB_BROKEN
          | 5 => ERROR
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_drag_result_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
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
