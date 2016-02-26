structure AtkRegistry :>
  ATK_REGISTRY
    where type 'a class_t = 'a AtkRegistryClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_registry_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class_t = 'a AtkRegistryClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
