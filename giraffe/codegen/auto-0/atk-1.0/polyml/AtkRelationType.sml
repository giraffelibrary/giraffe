structure AtkRelationType :>
  sig
    include ATK_RELATION_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      NULL
    | CONTROLLEDBY
    | CONTROLLERFOR
    | LABELFOR
    | LABELLEDBY
    | MEMBEROF
    | NODECHILDOF
    | FLOWSTO
    | FLOWSFROM
    | SUBWINDOWOF
    | EMBEDS
    | EMBEDDEDBY
    | POPUPFOR
    | PARENTWINDOWOF
    | DESCRIBEDBY
    | DESCRIPTIONFOR
    | NODEPARENTOF
    | LASTDEFINED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NULL => f 0
          | CONTROLLEDBY => f 1
          | CONTROLLERFOR => f 2
          | LABELFOR => f 3
          | LABELLEDBY => f 4
          | MEMBEROF => f 5
          | NODECHILDOF => f 6
          | FLOWSTO => f 7
          | FLOWSFROM => f 8
          | SUBWINDOWOF => f 9
          | EMBEDS => f 10
          | EMBEDDEDBY => f 11
          | POPUPFOR => f 12
          | PARENTWINDOWOF => f 13
          | DESCRIBEDBY => f 14
          | DESCRIPTIONFOR => f 15
          | NODEPARENTOF => f 16
          | LASTDEFINED => f 17
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NULL
          | 1 => CONTROLLEDBY
          | 2 => CONTROLLERFOR
          | 3 => LABELFOR
          | 4 => LABELLEDBY
          | 5 => MEMBEROF
          | 6 => NODECHILDOF
          | 7 => FLOWSTO
          | 8 => FLOWSFROM
          | 9 => SUBWINDOWOF
          | 10 => EMBEDS
          | 11 => EMBEDDEDBY
          | 12 => POPUPFOR
          | 13 => PARENTWINDOWOF
          | 14 => DESCRIBEDBY
          | 15 => DESCRIPTIONFOR
          | 16 => NODEPARENTOF
          | 17 => LASTDEFINED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_relation_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = NULL
    local
      open PolyMLFFI
    in
      val forName_ = call (load_sym libatk "atk_relation_type_for_name") (FFI.PolyML.String.INPTR --> PolyML.VAL)
      val getName_ = call (load_sym libatk "atk_relation_type_get_name") (PolyML.VAL --> FFI.PolyML.String.RETPTR)
      val register_ = call (load_sym libatk "atk_relation_type_register") (FFI.PolyML.String.INPTR --> PolyML.VAL)
    end
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (FFI.String.withConstPtr ---> C.fromVal) forName_ name
    fun getName type' = (C.withVal ---> FFI.String.fromPtr false) getName_ type'
    fun register name = (FFI.String.withConstPtr ---> C.fromVal) register_ name
  end
