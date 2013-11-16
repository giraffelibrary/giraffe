structure GLibError :>
  G_LIB_ERROR
    where type record_t = GLibErrorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_error_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type record_t = GLibErrorRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
