structure AtkRegistry :>
  ATK_REGISTRY
    where type 'a class = 'a AtkRegistryClass.class
    where type 'a object_factory_class = 'a AtkObjectFactoryClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_registry_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getFactory_ = call (getSymbol "atk_registry_get_factory") (AtkRegistryClass.PolyML.cPtr &&> GObjectType.PolyML.cVal --> AtkObjectFactoryClass.PolyML.cPtr)
      val getFactoryType_ = call (getSymbol "atk_registry_get_factory_type") (AtkRegistryClass.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GObjectType.PolyML.cVal)
      val setFactoryType_ =
        call (getSymbol "atk_registry_set_factory_type")
          (
            AtkRegistryClass.PolyML.cPtr
             &&> GObjectType.PolyML.cVal
             &&> GObjectType.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a AtkRegistryClass.class
    type 'a object_factory_class = 'a AtkObjectFactoryClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFactory self type' = (AtkRegistryClass.FFI.withPtr &&&> GObjectType.FFI.withVal ---> AtkObjectFactoryClass.FFI.fromPtr false) getFactory_ (self & type')
    fun getFactoryType self type' = (AtkRegistryClass.FFI.withPtr &&&> GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal) getFactoryType_ (self & type')
    fun setFactoryType self (type', factoryType) =
      (
        AtkRegistryClass.FFI.withPtr
         &&&> GObjectType.FFI.withVal
         &&&> GObjectType.FFI.withVal
         ---> I
      )
        setFactoryType_
        (
          self
           & type'
           & factoryType
        )
  end
