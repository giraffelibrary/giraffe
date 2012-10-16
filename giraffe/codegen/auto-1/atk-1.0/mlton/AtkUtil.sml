structure AtkUtil :>
  ATK_UTIL
    where type 'a class_t = 'a AtkUtilClass.t =
  struct
    val getType_ = _import "atk_util_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a AtkUtilClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
