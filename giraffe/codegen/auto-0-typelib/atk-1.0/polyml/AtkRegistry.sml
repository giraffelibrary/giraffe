structure AtkRegistry :>
  ATK_REGISTRY
    where type 'a class = 'a AtkRegistryClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_registry_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a AtkRegistryClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
