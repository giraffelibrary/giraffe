structure GObjectInitiallyUnowned :>
  G_OBJECT_INITIALLY_UNOWNED
    where type 'a class = 'a GObjectInitiallyUnownedClass.class
    where type type_t = GObjectType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgobject "g_initially_unowned_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GObjectInitiallyUnownedClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
