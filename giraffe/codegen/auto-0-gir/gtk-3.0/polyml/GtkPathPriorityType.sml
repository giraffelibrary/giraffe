structure GtkPathPriorityType :>
  sig
    include GTK_PATH_PRIORITY_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      LOWEST
    | GTK
    | APPLICATION
    | THEME
    | RC
    | HIGHEST
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            LOWEST => f 0
          | GTK => f 4
          | APPLICATION => f 8
          | THEME => f 10
          | RC => f 12
          | HIGHEST => f 15
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => LOWEST
          | 4 => GTK
          | 8 => APPLICATION
          | 10 => THEME
          | 12 => RC
          | 15 => HIGHEST
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
      val getType_ = call (load_sym libgtk "gtk_path_priority_type_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> FFI.PolyML.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = LOWEST
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
