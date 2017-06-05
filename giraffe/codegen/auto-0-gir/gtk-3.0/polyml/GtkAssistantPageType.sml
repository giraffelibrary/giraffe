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
        exception Value of GInt.t
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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_assistant_page_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
