structure AtkObjectFactory :>
  ATK_OBJECT_FACTORY
    where type 'a class = 'a AtkObjectFactoryClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_object_factory_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val createAccessible_ = call (load_sym libatk "atk_object_factory_create_accessible") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val invalidate_ = call (load_sym libatk "atk_object_factory_invalidate") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a AtkObjectFactoryClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createAccessible self obj = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr true) createAccessible_ (self & obj)
    fun invalidate self = (GObjectObjectClass.C.withPtr ---> I) invalidate_ self
  end
