structure Atk : ATK =
  struct
    val focusTrackerNotify_ = _import "atk_focus_tracker_notify" : AtkObjectClass.C.notnull AtkObjectClass.C.p -> unit;
    val getFocusObject_ = _import "atk_get_focus_object" : unit -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val getRoot_ = _import "atk_get_root" : unit -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val getToolkitName_ = _import "atk_get_toolkit_name" : unit -> Utf8.C.notnull Utf8.C.out_p;
    val getToolkitVersion_ = _import "atk_get_toolkit_version" : unit -> Utf8.C.notnull Utf8.C.out_p;
    val getVersion_ = _import "atk_get_version" : unit -> Utf8.C.notnull Utf8.C.out_p;
    structure ImplementorIfaceClass = AtkImplementorIfaceClass
    structure ObjectClass = AtkObjectClass
    fun focusTrackerNotify object = (AtkObjectClass.C.withPtr ---> I) focusTrackerNotify_ object
    fun getFocusObject () = (I ---> AtkObjectClass.C.fromPtr false) getFocusObject_ ()
    fun getRoot () = (I ---> AtkObjectClass.C.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> Utf8.C.fromPtr false) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> Utf8.C.fromPtr false) getToolkitVersion_ ()
    fun getVersion () = (I ---> Utf8.C.fromPtr false) getVersion_ ()
  end
