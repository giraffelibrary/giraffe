structure AtkRelationType :>
  sig
    include ATK_RELATION_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      NULL
    | CONTROLLED_BY
    | CONTROLLER_FOR
    | LABEL_FOR
    | LABELLED_BY
    | MEMBER_OF
    | NODE_CHILD_OF
    | FLOWS_TO
    | FLOWS_FROM
    | SUBWINDOW_OF
    | EMBEDS
    | EMBEDDED_BY
    | POPUP_FOR
    | PARENT_WINDOW_OF
    | DESCRIBED_BY
    | DESCRIPTION_FOR
    | NODE_PARENT_OF
    | LAST_DEFINED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NULL => f 0
          | CONTROLLED_BY => f 1
          | CONTROLLER_FOR => f 2
          | LABEL_FOR => f 3
          | LABELLED_BY => f 4
          | MEMBER_OF => f 5
          | NODE_CHILD_OF => f 6
          | FLOWS_TO => f 7
          | FLOWS_FROM => f 8
          | SUBWINDOW_OF => f 9
          | EMBEDS => f 10
          | EMBEDDED_BY => f 11
          | POPUP_FOR => f 12
          | PARENT_WINDOW_OF => f 13
          | DESCRIBED_BY => f 14
          | DESCRIPTION_FOR => f 15
          | NODE_PARENT_OF => f 16
          | LAST_DEFINED => f 17
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NULL
          | 1 => CONTROLLED_BY
          | 2 => CONTROLLER_FOR
          | 3 => LABEL_FOR
          | 4 => LABELLED_BY
          | 5 => MEMBER_OF
          | 6 => NODE_CHILD_OF
          | 7 => FLOWS_TO
          | 8 => FLOWS_FROM
          | 9 => SUBWINDOW_OF
          | 10 => EMBEDS
          | 11 => EMBEDDED_BY
          | 12 => POPUP_FOR
          | 13 => PARENT_WINDOW_OF
          | 14 => DESCRIBED_BY
          | 15 => DESCRIPTION_FOR
          | 16 => NODE_PARENT_OF
          | 17 => LAST_DEFINED
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
      val getType_ = call (load_sym libatk "atk_relation_type_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
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
    val null = NULL
    local
      open PolyMLFFI
    in
      val forName_ = call (load_sym libatk "atk_relation_type_for_name") (Utf8.PolyML.cInPtr --> PolyML.cVal)
      val getName_ = call (load_sym libatk "atk_relation_type_get_name") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val register_ = call (load_sym libatk "atk_relation_type_register") (Utf8.PolyML.cInPtr --> PolyML.cVal)
    end
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (Utf8.C.withPtr ---> C.fromVal) forName_ name
    fun getName type' = (C.withVal ---> Utf8.C.fromPtr false) getName_ type'
    fun register name = (Utf8.C.withPtr ---> C.fromVal) register_ name
  end
