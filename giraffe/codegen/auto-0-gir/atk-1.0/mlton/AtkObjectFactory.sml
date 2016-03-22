structure AtkObjectFactory :>
  ATK_OBJECT_FACTORY
    where type 'a class = 'a AtkObjectFactoryClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_object_factory_get_type" : unit -> GObjectType.C.val_;
    val createAccessible_ = fn x1 & x2 => (_import "atk_object_factory_create_accessible" : AtkObjectFactoryClass.C.notnull AtkObjectFactoryClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> AtkObjectClass.C.notnull AtkObjectClass.C.p;) (x1, x2)
    val invalidate_ = _import "atk_object_factory_invalidate" : AtkObjectFactoryClass.C.notnull AtkObjectFactoryClass.C.p -> unit;
    type 'a class = 'a AtkObjectFactoryClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createAccessible self obj = (AtkObjectFactoryClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr true) createAccessible_ (self & obj)
    fun invalidate self = (AtkObjectFactoryClass.C.withPtr ---> I) invalidate_ self
  end
