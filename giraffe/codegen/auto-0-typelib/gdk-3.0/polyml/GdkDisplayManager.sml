structure GdkDisplayManager :>
  GDK_DISPLAY_MANAGER
    where type 'a class_t = 'a GdkDisplayManagerClass.t
    where type 'a display_class_t = 'a GdkDisplayClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_display_manager_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val get_ = call (load_sym libgdk "gdk_display_manager_get") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getDefaultDisplay_ = call (load_sym libgdk "gdk_display_manager_get_default_display") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val openDisplay_ = call (load_sym libgdk "gdk_display_manager_open_display") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val setDefaultDisplay_ = call (load_sym libgdk "gdk_display_manager_set_default_display") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GdkDisplayManagerClass.t
    type 'a display_class_t = 'a GdkDisplayClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun get () = (I ---> GdkDisplayManagerClass.C.fromPtr false) get_ ()
    fun getDefaultDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDefaultDisplay_ self
    fun openDisplay self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GdkDisplayClass.C.fromPtr false) openDisplay_ (self & name)
    fun setDefaultDisplay self display = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setDefaultDisplay_ (self & display)
    local
      open ClosureMarshal Signal
    in
      fun displayOpenedSig f = signal "display-opened" (get 0w1 GdkDisplayClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val defaultDisplayProp =
        {
          get = fn x => get "default-display" GdkDisplayClass.tOpt x,
          set = fn x => set "default-display" GdkDisplayClass.tOpt x
        }
    end
  end
