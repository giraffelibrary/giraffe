structure AtkRelationType :>
  sig
    include ATK_RELATION_TYPE
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
    val getType_ = _import "atk_relation_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NULL
    val forName_ = _import "mlton_atk_relation_type_for_name" : cstring * unit CPointer.t -> C.val_;
    val getName_ = _import "atk_relation_type_get_name" : C.val_ -> FFI.String.notnull FFI.String.out_p;
    val register_ = _import "mlton_atk_relation_type_register" : cstring * unit CPointer.t -> C.val_;
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (FFI.String.withConstPtr ---> C.fromVal) forName_ name
    fun getName type' = (C.withVal ---> FFI.String.fromPtr false) getName_ type'
    fun register name = (FFI.String.withConstPtr ---> C.fromVal) register_ name
  end
