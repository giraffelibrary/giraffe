structure AtkGObjectAccessible :>
  ATK_G_OBJECT_ACCESSIBLE
    where type 'a class = 'a AtkGObjectAccessibleClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_gobject_accessible_get_type" : unit -> GObjectType.C.val_;
    val forObject_ = _import "atk_gobject_accessible_for_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val getObject_ = _import "atk_gobject_accessible_get_object" : AtkGObjectAccessibleClass.C.notnull AtkGObjectAccessibleClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class = 'a AtkGObjectAccessibleClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forObject obj = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) forObject_ obj
    fun getObject self = (AtkGObjectAccessibleClass.C.withPtr ---> GObjectObjectClass.C.fromPtr false) getObject_ self
  end
