structure GObjectInitiallyUnowned :>
  G_OBJECT_INITIALLY_UNOWNED
    where type 'a class_t = 'a GObjectInitiallyUnownedClass.t
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_initially_unowned_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a GObjectInitiallyUnownedClass.t
    type type_t = GObjectType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
