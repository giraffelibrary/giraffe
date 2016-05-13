structure AtkUtil :>
  ATK_UTIL
    where type 'a class = 'a AtkUtilClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_util_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a AtkUtilClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
