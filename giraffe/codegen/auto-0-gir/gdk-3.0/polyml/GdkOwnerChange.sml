structure GdkOwnerChange :> GDK_OWNER_CHANGE =
  struct
    datatype enum =
      NEW_OWNER
    | DESTROY
    | CLOSE
    structure Enum =
      Enum(
        type enum = enum
        val null = NEW_OWNER
        val toInt =
          fn
            NEW_OWNER => 0
          | DESTROY => 1
          | CLOSE => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NEW_OWNER
          | 1 => DESTROY
          | 2 => CLOSE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_owner_change_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
