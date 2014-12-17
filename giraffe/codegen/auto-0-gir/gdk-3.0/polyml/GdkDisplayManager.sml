structure GdkDisplayManager :>
  GDK_DISPLAY_MANAGER
    where type 'a class_t = 'a GdkDisplayManagerClass.t
    where type 'a displayclass_t = 'a GdkDisplayClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_display_manager_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val get_ = call (load_sym libgdk "gdk_display_manager_get") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDefaultDisplay_ = call (load_sym libgdk "gdk_display_manager_get_default_display") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val openDisplay_ = call (load_sym libgdk "gdk_display_manager_open_display") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val setDefaultDisplay_ = call (load_sym libgdk "gdk_display_manager_set_default_display") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GdkDisplayManagerClass.t
    type 'a displayclass_t = 'a GdkDisplayClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun get () = (I ---> GdkDisplayManagerClass.C.fromPtr false) get_ ()
    fun getDefaultDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDefaultDisplay_ self
    fun openDisplay self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GdkDisplayClass.C.fromPtr false) openDisplay_ (self & name)
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
