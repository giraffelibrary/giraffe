structure GtkDragResult :> GTK_DRAG_RESULT =
  struct
    datatype enum =
      SUCCESS
    | NO_TARGET
    | USER_CANCELLED
    | TIMEOUT_EXPIRED
    | GRAB_BROKEN
    | ERROR
    structure Enum =
      Enum(
        type enum = enum
        val null = SUCCESS
        val toInt =
          fn
            SUCCESS => 0
          | NO_TARGET => 1
          | USER_CANCELLED => 2
          | TIMEOUT_EXPIRED => 3
          | GRAB_BROKEN => 4
          | ERROR => 5
        exception Value of GInt.t
        val fromInt =
          fn
            0 => SUCCESS
          | 1 => NO_TARGET
          | 2 => USER_CANCELLED
          | 3 => TIMEOUT_EXPIRED
          | 4 => GRAB_BROKEN
          | 5 => ERROR
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_drag_result_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
