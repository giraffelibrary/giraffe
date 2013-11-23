structure GtkAssistantPageType :>
  sig
    include GTK_ASSISTANT_PAGE_TYPE
  end =
  struct
    datatype t =
      CONTENT
    | INTRO
    | CONFIRM
    | SUMMARY
    | PROGRESS
    | CUSTOM
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            CONTENT => f 0
          | INTRO => f 1
          | CONFIRM => f 2
          | SUMMARY => f 3
          | PROGRESS => f 4
          | CUSTOM => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => CONTENT
          | 1 => INTRO
          | 2 => CONFIRM
          | 3 => SUMMARY
          | 4 => PROGRESS
          | 5 => CUSTOM
          | n => raise Value n
      end
    val getType_ = _import "gtk_assistant_page_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = CONTENT
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
