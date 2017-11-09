structure GtkCssSectionType :> GTK_CSS_SECTION_TYPE =
  struct
    datatype enum =
      DOCUMENT
    | IMPORT
    | COLOR_DEFINITION
    | BINDING_SET
    | RULESET
    | SELECTOR
    | DECLARATION
    | VALUE
    structure Enum =
      Enum(
        type enum = enum
        val null = DOCUMENT
        val toInt =
          fn
            DOCUMENT => 0
          | IMPORT => 1
          | COLOR_DEFINITION => 2
          | BINDING_SET => 3
          | RULESET => 4
          | SELECTOR => 5
          | DECLARATION => 6
          | VALUE => 7
        exception Value of GInt.t
        val fromInt =
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
      )
    open Enum
    val getType_ = _import "gtk_css_section_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
