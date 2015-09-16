structure GtkCssSectionType :>
  sig
    include GTK_CSS_SECTION_TYPE
  end =
  struct
    datatype t =
      DOCUMENT
    | IMPORT
    | COLOR_DEFINITION
    | BINDING_SET
    | RULESET
    | SELECTOR
    | DECLARATION
    | VALUE
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            DOCUMENT => f 0
          | IMPORT => f 1
          | COLOR_DEFINITION => f 2
          | BINDING_SET => f 3
          | RULESET => f 4
          | SELECTOR => f 5
          | DECLARATION => f 6
          | VALUE => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => DOCUMENT
          | 1 => IMPORT
          | 2 => COLOR_DEFINITION
          | 3 => BINDING_SET
          | 4 => RULESET
          | 5 => SELECTOR
          | 6 => DECLARATION
          | 7 => VALUE
          | n => raise Value n
      end
    val getType_ = _import "gtk_css_section_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = DOCUMENT
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
