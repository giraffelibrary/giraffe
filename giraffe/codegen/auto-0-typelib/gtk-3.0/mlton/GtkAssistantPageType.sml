structure GtkAssistantPageType :> GTK_ASSISTANT_PAGE_TYPE =
  struct
    datatype enum =
      CONTENT
    | INTRO
    | CONFIRM
    | SUMMARY
    | PROGRESS
    | CUSTOM
    structure Enum =
      Enum(
        type enum = enum
        val null = CONTENT
        val toInt =
          fn
            CONTENT => 0
          | INTRO => 1
          | CONFIRM => 2
          | SUMMARY => 3
          | PROGRESS => 4
          | CUSTOM => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => CONTENT
          | 1 => INTRO
          | 2 => CONFIRM
          | 3 => SUMMARY
          | 4 => PROGRESS
          | 5 => CUSTOM
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_assistant_page_type_get_type" : unit -> GObjectType.FFI.val_;
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
