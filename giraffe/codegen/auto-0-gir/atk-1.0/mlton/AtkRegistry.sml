structure AtkRegistry :>
  ATK_REGISTRY
    where type 'a class_t = 'a AtkRegistryClass.t =
  struct
    val getType_ = _import "atk_registry_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a AtkRegistryClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
