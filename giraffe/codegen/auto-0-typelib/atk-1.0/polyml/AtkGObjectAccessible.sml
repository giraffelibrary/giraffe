structure AtkGObjectAccessible :>
  ATK_G_OBJECT_ACCESSIBLE
    where type 'a class_t = 'a AtkGObjectAccessibleClass.t
    where type 'a object_class_t = 'a AtkObjectClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_gobject_accessible_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val forObject_ = call (load_sym libatk "atk_gobject_accessible_for_object") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getObject_ = call (load_sym libatk "atk_gobject_accessible_get_object") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a AtkGObjectAccessibleClass.t
    type 'a object_class_t = 'a AtkObjectClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun forObject obj = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) forObject_ obj
    fun getObject self = (GObjectObjectClass.C.withPtr ---> GObjectObjectClass.C.fromPtr false) getObject_ self
  end
