structure AtkGObjectAccessible :>
  ATK_G_OBJECT_ACCESSIBLE
    where type 'a class_t = 'a AtkGObjectAccessibleClass.t
    where type 'a objectclass_t = 'a AtkObjectClass.t =
  struct
    val getType_ = _import "atk_gobject_accessible_get_type" : unit -> GObjectType.C.val_;
    val forObject_ = _import "atk_gobject_accessible_for_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getObject_ = _import "atk_gobject_accessible_get_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a AtkGObjectAccessibleClass.t
    type 'a objectclass_t = 'a AtkObjectClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forObject obj = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) forObject_ obj
    fun getObject self = (GObjectObjectClass.C.withPtr ---> GObjectObjectClass.C.fromPtr false) getObject_ self
  end
