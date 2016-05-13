structure GtkDirectionType :>
  sig
    include GTK_DIRECTION_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      TAB_FORWARD
    | TAB_BACKWARD
    | UP
    | DOWN
    | LEFT
    | RIGHT
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            TAB_FORWARD => f 0
          | TAB_BACKWARD => f 1
          | UP => f 2
          | DOWN => f 3
          | LEFT => f 4
          | RIGHT => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => TAB_FORWARD
          | 1 => TAB_BACKWARD
          | 2 => UP
          | 3 => DOWN
          | 4 => LEFT
          | 5 => RIGHT
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_direction_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = TAB_FORWARD
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
