structure AtkObjectFactory :>
  ATK_OBJECT_FACTORY
    where type 'a class = 'a AtkObjectFactoryClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_object_factory_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val createAccessible_ = call (load_sym libatk "atk_object_factory_create_accessible") (AtkObjectFactoryClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val invalidate_ = call (load_sym libatk "atk_object_factory_invalidate") (AtkObjectFactoryClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a AtkObjectFactoryClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createAccessible self obj = (AtkObjectFactoryClass.FFI.withPtr &&&> GObjectObjectClass.FFI.withPtr ---> AtkObjectClass.FFI.fromPtr true) createAccessible_ (self & obj)
    fun invalidate self = (AtkObjectFactoryClass.FFI.withPtr ---> I) invalidate_ self
  end
