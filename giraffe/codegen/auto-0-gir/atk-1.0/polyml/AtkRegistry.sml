structure AtkRegistry :>
  ATK_REGISTRY
    where type 'a class = 'a AtkRegistryClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_registry_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a AtkRegistryClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
