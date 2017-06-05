structure Atk : ATK =
  struct
    val focusTrackerNotify_ = _import "atk_focus_tracker_notify" : AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p -> unit;
    val getFocusObject_ = _import "atk_get_focus_object" : unit -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    val getRoot_ = _import "atk_get_root" : unit -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    val getToolkitName_ = _import "atk_get_toolkit_name" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getToolkitVersion_ = _import "atk_get_toolkit_version" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getVersion_ = _import "atk_get_version" : unit -> Utf8.FFI.notnull Utf8.FFI.out_p;
    structure ImplementorIfaceClass = AtkImplementorIfaceClass
    structure ObjectClass = AtkObjectClass
    fun focusTrackerNotify object = (AtkObjectClass.FFI.withPtr ---> I) focusTrackerNotify_ object
    fun getFocusObject () = (I ---> AtkObjectClass.FFI.fromPtr false) getFocusObject_ ()
    fun getRoot () = (I ---> AtkObjectClass.FFI.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> Utf8.FFI.fromPtr 0) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> Utf8.FFI.fromPtr 0) getToolkitVersion_ ()
    fun getVersion () = (I ---> Utf8.FFI.fromPtr 0) getVersion_ ()
  end
