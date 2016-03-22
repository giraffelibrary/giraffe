structure GdkDisplayManager :>
  GDK_DISPLAY_MANAGER
    where type 'a class = 'a GdkDisplayManagerClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_display_manager_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val get_ = call (load_sym libgdk "gdk_display_manager_get") (FFI.PolyML.cVoid --> GdkDisplayManagerClass.PolyML.cPtr)
      val getDefaultDisplay_ = call (load_sym libgdk "gdk_display_manager_get_default_display") (GdkDisplayManagerClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val openDisplay_ = call (load_sym libgdk "gdk_display_manager_open_display") (GdkDisplayManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GdkDisplayClass.PolyML.cPtr)
      val setDefaultDisplay_ = call (load_sym libgdk "gdk_display_manager_set_default_display") (GdkDisplayManagerClass.PolyML.cPtr &&> GdkDisplayClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GdkDisplayManagerClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun get () = (I ---> GdkDisplayManagerClass.C.fromPtr false) get_ ()
    fun getDefaultDisplay self = (GdkDisplayManagerClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDefaultDisplay_ self
    fun openDisplay self name = (GdkDisplayManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> GdkDisplayClass.C.fromPtr false) openDisplay_ (self & name)
    fun setDefaultDisplay self display = (GdkDisplayManagerClass.C.withPtr &&&> GdkDisplayClass.C.withPtr ---> I) setDefaultDisplay_ (self & display)
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
