structure AtkGObjectAccessible :>
  ATK_G_OBJECT_ACCESSIBLE
    where type 'a class = 'a AtkGObjectAccessibleClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_gobject_accessible_get_type" : unit -> GObjectType.FFI.val_;
    val forObject_ = _import "atk_gobject_accessible_for_object" : GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;
    val getObject_ = _import "atk_gobject_accessible_get_object" : AtkGObjectAccessibleClass.FFI.non_opt AtkGObjectAccessibleClass.FFI.p -> GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p;
    type 'a class = 'a AtkGObjectAccessibleClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forObject obj = (GObjectObjectClass.FFI.withPtr ---> AtkObjectClass.FFI.fromPtr false) forObject_ obj
    fun getObject self = (AtkGObjectAccessibleClass.FFI.withPtr ---> GObjectObjectClass.FFI.fromPtr false) getObject_ self
  end
