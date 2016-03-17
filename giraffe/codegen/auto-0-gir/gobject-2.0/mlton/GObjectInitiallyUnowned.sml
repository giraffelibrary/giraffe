structure GObjectInitiallyUnowned :>
  G_OBJECT_INITIALLY_UNOWNED
    where type 'a class = 'a GObjectInitiallyUnownedClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_initially_unowned_get_type" : unit -> GObjectType.C.val_;
    type 'a class = 'a GObjectInitiallyUnownedClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
