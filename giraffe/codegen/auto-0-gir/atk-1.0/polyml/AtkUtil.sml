structure AtkUtil :>
  ATK_UTIL
    where type 'a class = 'a AtkUtilClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_util_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a AtkUtilClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
