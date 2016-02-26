structure AtkObjectFactory :>
  ATK_OBJECT_FACTORY
    where type 'a class_t = 'a AtkObjectFactoryClass.t
    where type 'a object_class_t = 'a AtkObjectClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_object_factory_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val createAccessible_ = call (load_sym libatk "atk_object_factory_create_accessible") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val invalidate_ = call (load_sym libatk "atk_object_factory_invalidate") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a AtkObjectFactoryClass.t
    type 'a object_class_t = 'a AtkObjectClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createAccessible self obj = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr true) createAccessible_ (self & obj)
    fun invalidate self = (GObjectObjectClass.C.withPtr ---> I) invalidate_ self
  end
