structure GdkDisplayManager :>
  GDK_DISPLAY_MANAGER
    where type 'a class_t = 'a GdkDisplayManagerClass.t
    where type 'a display_class_t = 'a GdkDisplayClass.t =
  struct
    val getType_ = _import "gdk_display_manager_get_type" : unit -> GObjectType.C.val_;
    val get_ = _import "gdk_display_manager_get" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDefaultDisplay_ = _import "gdk_display_manager_get_default_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val openDisplay_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_display_manager_open_display" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setDefaultDisplay_ = fn x1 & x2 => (_import "gdk_display_manager_set_default_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class_t = 'a GdkDisplayManagerClass.t
    type 'a display_class_t = 'a GdkDisplayClass.t
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
