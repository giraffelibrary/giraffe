structure AtkRegistry :>
  ATK_REGISTRY
    where type 'a class = 'a AtkRegistryClass.class
    where type 'a object_factory_class = 'a AtkObjectFactoryClass.class =
  struct
    val getType_ = _import "atk_registry_get_type" : unit -> GObjectType.FFI.val_;
    val getFactory_ = fn x1 & x2 => (_import "atk_registry_get_factory" : AtkRegistryClass.FFI.non_opt AtkRegistryClass.FFI.p * GObjectType.FFI.val_ -> AtkObjectFactoryClass.FFI.non_opt AtkObjectFactoryClass.FFI.p;) (x1, x2)
    val getFactoryType_ = fn x1 & x2 => (_import "atk_registry_get_factory_type" : AtkRegistryClass.FFI.non_opt AtkRegistryClass.FFI.p * GObjectType.FFI.val_ -> GObjectType.FFI.val_;) (x1, x2)
    val setFactoryType_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "atk_registry_set_factory_type" :
              AtkRegistryClass.FFI.non_opt AtkRegistryClass.FFI.p
               * GObjectType.FFI.val_
               * GObjectType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a AtkRegistryClass.class
    type 'a object_factory_class = 'a AtkObjectFactoryClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFactory self type' = (AtkRegistryClass.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> AtkObjectFactoryClass.FFI.fromPtr false) getFactory_ (self & type') before AtkRegistryClass.FFI.touchPtr self
    fun getFactoryType self type' = (AtkRegistryClass.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GObjectType.FFI.fromVal) getFactoryType_ (self & type')
    fun setFactoryType self (type', factoryType) =
      (
        AtkRegistryClass.FFI.withPtr false
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
