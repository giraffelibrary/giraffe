structure Atk : ATK =
  struct
    local
      open PolyMLFFI
    in
      val focusTrackerNotify_ = call (load_sym libatk "atk_focus_tracker_notify") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getFocusObject_ = call (load_sym libatk "atk_get_focus_object") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getRoot_ = call (load_sym libatk "atk_get_root") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getToolkitName_ = call (load_sym libatk "atk_get_toolkit_name") (FFI.PolyML.VOID --> FFI.String.PolyML.RETPTR)
      val getToolkitVersion_ = call (load_sym libatk "atk_get_toolkit_version") (FFI.PolyML.VOID --> FFI.String.PolyML.RETPTR)
      val getVersion_ = call (load_sym libatk "atk_get_version") (FFI.PolyML.VOID --> FFI.String.PolyML.RETPTR)
    end
    structure ImplementorIfaceClass = AtkImplementorIfaceClass
    structure ObjectClass = AtkObjectClass
    fun focusTrackerNotify object = (GObjectObjectClass.C.withPtr ---> I) focusTrackerNotify_ object
    fun getFocusObject () = (I ---> AtkObjectClass.C.fromPtr false) getFocusObject_ ()
    fun getRoot () = (I ---> AtkObjectClass.C.fromPtr false) getRoot_ ()
    fun getToolkitName () = (I ---> FFI.String.C.fromPtr false) getToolkitName_ ()
    fun getToolkitVersion () = (I ---> FFI.String.C.fromPtr false) getToolkitVersion_ ()
    fun getVersion () = (I ---> FFI.String.C.fromPtr false) getVersion_ ()
  end
