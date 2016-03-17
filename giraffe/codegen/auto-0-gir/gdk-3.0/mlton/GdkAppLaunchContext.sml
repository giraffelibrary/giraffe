structure GdkAppLaunchContext :>
  GDK_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GdkAppLaunchContextClass.class
    where type 'a screen_class = 'a GdkScreenClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    val getType_ = _import "gdk_app_launch_context_get_type" : unit -> GObjectType.C.val_;
    val setDesktop_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_desktop" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_app_launch_context_set_icon_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setTimestamp_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_timestamp" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GdkAppLaunchContextClass.class
    type 'a screen_class = 'a GdkScreenClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun setDesktop self desktop = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setDesktop_ (self & desktop)
    fun setIcon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setIcon_ (self & icon)
    fun setIconName self iconName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setIconName_ (self & iconName)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setTimestamp self timestamp = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setTimestamp_ (self & timestamp)
    local
      open Property
    in
      val displayProp =
        {
          get = fn x => get "display" GdkDisplayClass.tOpt x,
          set = fn x => set "display" GdkDisplayClass.tOpt x
        }
    end
  end
