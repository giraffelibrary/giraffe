structure AtkUtil :>
  ATK_UTIL
    where type 'a class_t = 'a AtkUtilClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_util_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a AtkUtilClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
