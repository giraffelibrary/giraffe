structure AtkRelationType :> ATK_RELATION_TYPE =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = NULL
        val toInt =
          fn
            NULL => 0
          | CONTROLLED_BY => 1
          | CONTROLLER_FOR => 2
          | LABEL_FOR => 3
          | LABELLED_BY => 4
          | MEMBER_OF => 5
          | NODE_CHILD_OF => 6
          | FLOWS_TO => 7
          | FLOWS_FROM => 8
          | SUBWINDOW_OF => 9
          | EMBEDS => 10
          | EMBEDDED_BY => 11
          | POPUP_FOR => 12
          | PARENT_WINDOW_OF => 13
          | DESCRIBED_BY => 14
          | DESCRIPTION_FOR => 15
          | NODE_PARENT_OF => 16
          | LAST_DEFINED => 17
        exception Value of GInt.t
        val fromInt =
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
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_relation_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    local
      open PolyMLFFI
    in
      val forName_ = call (getSymbol "atk_relation_type_for_name") (Utf8.PolyML.cInPtr --> PolyML.cVal)
      val getName_ = call (getSymbol "atk_relation_type_get_name") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val register_ = call (getSymbol "atk_relation_type_register") (Utf8.PolyML.cInPtr --> PolyML.cVal)
    end
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forName name = (Utf8.FFI.withPtr ---> FFI.fromVal) forName_ name
    fun getName type' = (FFI.withVal ---> Utf8.FFI.fromPtr 0) getName_ type'
    fun register name = (Utf8.FFI.withPtr ---> FFI.fromVal) register_ name
  end
