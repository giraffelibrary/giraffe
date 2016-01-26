structure AtkRelationType :>
  sig
    include ATK_RELATION_TYPE
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
    val forName_ = _import "mlton_atk_relation_type_for_name" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> C.val_;
    val getName_ = _import "atk_relation_type_get_name" : C.val_ -> FFI.String.C.notnull FFI.String.C.out_p;
    val register_ = _import "mlton_atk_relation_type_register" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> C.val_;
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forName name = (FFI.String.C.withConstPtr ---> C.fromVal) forName_ name
    fun getName type' = (C.withVal ---> FFI.String.C.fromPtr false) getName_ type'
    fun register name = (FFI.String.C.withConstPtr ---> C.fromVal) register_ name
  end
