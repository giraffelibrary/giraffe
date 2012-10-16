structure Atk : ATK =
  struct
    val focusTrackerNotify_ = _import "atk_focus_tracker_notify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getFocusObject_ = _import "atk_get_focus_object" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getRoot_ = _import "atk_get_root" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getToolkitName_ = _import "atk_get_toolkit_name" : unit -> FFI.String.notnull FFI.String.out_p;
    val getToolkitVersion_ = _import "atk_get_toolkit_version" : unit -> FFI.String.notnull FFI.String.out_p;
    val getVersion_ = _import "atk_get_version" : unit -> FFI.String.notnull FFI.String.out_p;
    structure ImplementorIfaceClass = AtkImplementorIfaceClass
    structure ObjectClass = AtkObjectClass
    fun focusTrackerNotify object = (GObjectObjectClass.C.withPtr ---> I) focusTrackerNotify_ object
    fun getFocusObject () = (I ---> AtkObjectClass.C.fromPtr false) getFocusObject_ ()
    fun getRoot () = (I ---> AtkObjectClass.C.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> FFI.String.fromPtr false) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> FFI.String.fromPtr false) getToolkitVersion_ ()
    fun getVersion () = (I ---> FFI.String.fromPtr false) getVersion_ ()
  end
