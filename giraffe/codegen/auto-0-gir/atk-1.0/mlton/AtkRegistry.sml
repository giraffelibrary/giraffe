structure AtkRegistry :>
  ATK_REGISTRY
    where type 'a class = 'a AtkRegistryClass.class =
  struct
    val getType_ = _import "atk_registry_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a AtkRegistryClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
