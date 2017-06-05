structure GLibError :>
  G_LIB_ERROR
    where type t = GLibErrorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ =
        call
          (load_sym libgobject "g_error_get_type")
          (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type t = GLibErrorRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
