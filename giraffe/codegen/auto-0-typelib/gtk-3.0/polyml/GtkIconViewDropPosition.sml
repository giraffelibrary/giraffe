structure GtkIconViewDropPosition :>
  sig
    include GTK_ICON_VIEW_DROP_POSITION
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      NO_DROP
    | DROP_INTO
    | DROP_LEFT
    | DROP_RIGHT
    | DROP_ABOVE
    | DROP_BELOW
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NO_DROP => f 0
          | DROP_INTO => f 1
          | DROP_LEFT => f 2
          | DROP_RIGHT => f 3
          | DROP_ABOVE => f 4
          | DROP_BELOW => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NO_DROP
          | 1 => DROP_INTO
          | 2 => DROP_LEFT
          | 3 => DROP_RIGHT
          | 4 => DROP_ABOVE
          | 5 => DROP_BELOW
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
      val getType_ = call (load_sym libgtk "gtk_icon_view_drop_position_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = NO_DROP
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
