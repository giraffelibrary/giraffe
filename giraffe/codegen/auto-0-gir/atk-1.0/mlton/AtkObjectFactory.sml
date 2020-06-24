structure AtkObjectFactory :>
  ATK_OBJECT_FACTORY
    where type 'a class = 'a AtkObjectFactoryClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_object_factory_get_type" : unit -> GObjectType.FFI.val_;
    val createAccessible_ = fn x1 & x2 => (_import "atk_object_factory_create_accessible" : AtkObjectFactoryClass.FFI.non_opt AtkObjectFactoryClass.FFI.p * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;) (x1, x2)
    val getAccessibleType_ = _import "atk_object_factory_get_accessible_type" : AtkObjectFactoryClass.FFI.non_opt AtkObjectFactoryClass.FFI.p -> GObjectType.FFI.val_;
    val invalidate_ = _import "atk_object_factory_invalidate" : AtkObjectFactoryClass.FFI.non_opt AtkObjectFactoryClass.FFI.p -> unit;
    type 'a class = 'a AtkObjectFactoryClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createAccessible self obj = (AtkObjectFactoryClass.FFI.withPtr &&&> GObjectObjectClass.FFI.withPtr ---> AtkObjectClass.FFI.fromPtr true) createAccessible_ (self & obj)
    fun getAccessibleType self = (AtkObjectFactoryClass.FFI.withPtr ---> GObjectType.FFI.fromVal) getAccessibleType_ self
    fun invalidate self = (AtkObjectFactoryClass.FFI.withPtr ---> I) invalidate_ self
  end
