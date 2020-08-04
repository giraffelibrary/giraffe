structure AtkGObjectAccessible :>
  ATK_G_OBJECT_ACCESSIBLE
    where type 'a class = 'a AtkGObjectAccessibleClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_gobject_accessible_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val forObject_ = call (getSymbol "atk_gobject_accessible_for_object") (GObjectObjectClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val getObject_ = call (getSymbol "atk_gobject_accessible_get_object") (AtkGObjectAccessibleClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a AtkGObjectAccessibleClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forObject obj = (GObjectObjectClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr false) forObject_ obj
    fun getObject self = (AtkGObjectAccessibleClass.FFI.withPtr false ---> GObjectObjectClass.FFI.fromPtr false) getObject_ self
  end
