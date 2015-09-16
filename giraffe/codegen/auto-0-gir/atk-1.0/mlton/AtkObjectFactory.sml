structure AtkObjectFactory :>
  ATK_OBJECT_FACTORY
    where type 'a class_t = 'a AtkObjectFactoryClass.t
    where type 'a object_class_t = 'a AtkObjectClass.t =
  struct
    val getType_ = _import "atk_object_factory_get_type" : unit -> GObjectType.C.val_;
    val createAccessible_ = fn x1 & x2 => (_import "atk_object_factory_create_accessible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val invalidate_ = _import "atk_object_factory_invalidate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a AtkObjectFactoryClass.t
    type 'a object_class_t = 'a AtkObjectClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createAccessible self obj = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr true) createAccessible_ (self & obj)
    fun invalidate self = (GObjectObjectClass.C.withPtr ---> I) invalidate_ self
  end
