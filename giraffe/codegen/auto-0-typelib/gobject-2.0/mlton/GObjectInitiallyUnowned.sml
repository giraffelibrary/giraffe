structure GObjectInitiallyUnowned :>
  G_OBJECT_INITIALLY_UNOWNED
    where type 'a class_t = 'a GObjectInitiallyUnownedClass.t
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_initially_unowned_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GObjectInitiallyUnownedClass.t
    type type_t = GObjectType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
