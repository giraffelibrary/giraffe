structure Atk : ATK =
  struct
    local
      open PolyMLFFI
    in
      val focusTrackerNotify_ = call (load_sym libatk "atk_focus_tracker_notify") (AtkObjectClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getFocusObject_ = call (load_sym libatk "atk_get_focus_object") (PolyMLFFI.cVoid --> AtkObjectClass.PolyML.cPtr)
      val getRoot_ = call (load_sym libatk "atk_get_root") (PolyMLFFI.cVoid --> AtkObjectClass.PolyML.cPtr)
      val getToolkitName_ = call (load_sym libatk "atk_get_toolkit_name") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
      val getToolkitVersion_ = call (load_sym libatk "atk_get_toolkit_version") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
      val getVersion_ = call (load_sym libatk "atk_get_version") (PolyMLFFI.cVoid --> Utf8.PolyML.cOutPtr)
    end
    structure ImplementorIfaceClass = AtkImplementorIfaceClass
    structure ObjectClass = AtkObjectClass
    fun focusTrackerNotify object = (AtkObjectClass.C.withPtr ---> I) focusTrackerNotify_ object
    fun getFocusObject () = (I ---> AtkObjectClass.C.fromPtr false) getFocusObject_ ()
    fun getRoot () = (I ---> AtkObjectClass.C.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> Utf8.C.fromPtr false) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> Utf8.C.fromPtr false) getToolkitVersion_ ()
    fun getVersion () = (I ---> Utf8.C.fromPtr false) getVersion_ ()
  end
