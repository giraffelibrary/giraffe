structure GdkDisplayManager :>
  GDK_DISPLAY_MANAGER
    where type 'a class = 'a GdkDisplayManagerClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_display_manager_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val get_ = call (load_sym libgdk "gdk_display_manager_get") (PolyMLFFI.cVoid --> GdkDisplayManagerClass.PolyML.cPtr)
      val getDefaultDisplay_ = call (load_sym libgdk "gdk_display_manager_get_default_display") (GdkDisplayManagerClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val openDisplay_ = call (load_sym libgdk "gdk_display_manager_open_display") (GdkDisplayManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GdkDisplayClass.PolyML.cPtr)
      val setDefaultDisplay_ = call (load_sym libgdk "gdk_display_manager_set_default_display") (GdkDisplayManagerClass.PolyML.cPtr &&> GdkDisplayClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GdkDisplayManagerClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun get () = (I ---> GdkDisplayManagerClass.FFI.fromPtr false) get_ ()
    fun getDefaultDisplay self = (GdkDisplayManagerClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDefaultDisplay_ self
    fun openDisplay self name = (GdkDisplayManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) openDisplay_ (self & name)
    fun setDefaultDisplay self display = (GdkDisplayManagerClass.FFI.withPtr &&&> GdkDisplayClass.FFI.withPtr ---> I) setDefaultDisplay_ (self & display)
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
