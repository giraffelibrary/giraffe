structure AtkUtil :>
  ATK_UTIL
    where type 'a class = 'a AtkUtilClass.class =
  struct
    val getType_ = _import "atk_util_get_type" : unit -> GObjectType.C.val_;
    type 'a class = 'a AtkUtilClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
