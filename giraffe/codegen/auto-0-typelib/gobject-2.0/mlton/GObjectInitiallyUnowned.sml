structure GObjectInitiallyUnowned :>
  G_OBJECT_INITIALLY_UNOWNED
    where type 'a class = 'a GObjectInitiallyUnownedClass.class
    where type type_t = GObjectType.t =
  struct
    val getType_ = _import "g_initially_unowned_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GObjectInitiallyUnownedClass.class
    type type_t = GObjectType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
