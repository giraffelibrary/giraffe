structure GdkAppLaunchContext :>
  GDK_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GdkAppLaunchContextClass.class
    where type 'a screen_class = 'a GdkScreenClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    val getType_ = _import "gdk_app_launch_context_get_type" : unit -> GObjectType.C.val_;
    val setDesktop_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_desktop" : GdkAppLaunchContextClass.C.notnull GdkAppLaunchContextClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_icon" : GdkAppLaunchContextClass.C.notnull GdkAppLaunchContextClass.C.p * unit GioIconClass.C.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_app_launch_context_set_icon_name" :
              GdkAppLaunchContextClass.C.notnull GdkAppLaunchContextClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_screen" : GdkAppLaunchContextClass.C.notnull GdkAppLaunchContextClass.C.p * GdkScreenClass.C.notnull GdkScreenClass.C.p -> unit;) (x1, x2)
    val setTimestamp_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_timestamp" : GdkAppLaunchContextClass.C.notnull GdkAppLaunchContextClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GdkAppLaunchContextClass.class
    type 'a screen_class = 'a GdkScreenClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun setDesktop self desktop = (GdkAppLaunchContextClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setDesktop_ (self & desktop)
    fun setIcon self icon = (GdkAppLaunchContextClass.C.withPtr &&&> GioIconClass.C.withOptPtr ---> I) setIcon_ (self & icon)
    fun setIconName self iconName = (GdkAppLaunchContextClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setIconName_ (self & iconName)
    fun setScreen self screen = (GdkAppLaunchContextClass.C.withPtr &&&> GdkScreenClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setTimestamp self timestamp = (GdkAppLaunchContextClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setTimestamp_ (self & timestamp)
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
