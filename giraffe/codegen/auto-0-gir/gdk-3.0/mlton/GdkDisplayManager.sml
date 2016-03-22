structure GdkDisplayManager :>
  GDK_DISPLAY_MANAGER
    where type 'a class = 'a GdkDisplayManagerClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    val getType_ = _import "gdk_display_manager_get_type" : unit -> GObjectType.C.val_;
    val get_ = _import "gdk_display_manager_get" : unit -> GdkDisplayManagerClass.C.notnull GdkDisplayManagerClass.C.p;
    val getDefaultDisplay_ = _import "gdk_display_manager_get_default_display" : GdkDisplayManagerClass.C.notnull GdkDisplayManagerClass.C.p -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
    val openDisplay_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_display_manager_open_display" :
              GdkDisplayManagerClass.C.notnull GdkDisplayManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefaultDisplay_ = fn x1 & x2 => (_import "gdk_display_manager_set_default_display" : GdkDisplayManagerClass.C.notnull GdkDisplayManagerClass.C.p * GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> unit;) (x1, x2)
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
