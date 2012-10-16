structure Atk : ATK =
  struct
    local
      open PolyMLFFI
    in
      val focusTrackerNotify_ = call (load_sym libatk "atk_focus_tracker_notify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getFocusObject_ = call (load_sym libatk "atk_get_focus_object") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getRoot_ = call (load_sym libatk "atk_get_root") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getToolkitName_ = call (load_sym libatk "atk_get_toolkit_name") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getToolkitVersion_ = call (load_sym libatk "atk_get_toolkit_version") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
      val getVersion_ = call (load_sym libatk "atk_get_version") (FFI.PolyML.VOID --> FFI.PolyML.String.RETPTR)
    end
    structure ImplementorIfaceClass = AtkImplementorIfaceClass
    structure ObjectClass = AtkObjectClass
    fun focusTrackerNotify object = (GObjectObjectClass.C.withPtr ---> I) focusTrackerNotify_ object
    fun getFocusObject () = (I ---> AtkObjectClass.C.fromPtr false) getFocusObject_ ()
    fun getRoot () = (I ---> AtkObjectClass.C.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> FFI.String.fromPtr false) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> FFI.String.fromPtr false) getToolkitVersion_ ()
    fun getVersion () = (I ---> FFI.String.fromPtr false) getVersion_ ()
  end
