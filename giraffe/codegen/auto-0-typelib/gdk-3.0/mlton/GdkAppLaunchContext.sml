structure GdkAppLaunchContext :>
  GDK_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GdkAppLaunchContextClass.class
    where type 'a screen_class = 'a GdkScreenClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    val getType_ = _import "gdk_app_launch_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gdk_app_launch_context_new" : unit -> GdkAppLaunchContextClass.FFI.non_opt GdkAppLaunchContextClass.FFI.p;
    val setDesktop_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_desktop" : GdkAppLaunchContextClass.FFI.non_opt GdkAppLaunchContextClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setDisplay_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_display" : GdkAppLaunchContextClass.FFI.non_opt GdkAppLaunchContextClass.FFI.p * GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> unit;) (x1, x2)
    val setIcon_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_icon" : GdkAppLaunchContextClass.FFI.non_opt GdkAppLaunchContextClass.FFI.p * GioIconClass.FFI.opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val setIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_app_launch_context_set_icon_name" :
              GdkAppLaunchContextClass.FFI.non_opt GdkAppLaunchContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setScreen_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_screen" : GdkAppLaunchContextClass.FFI.non_opt GdkAppLaunchContextClass.FFI.p * GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p -> unit;) (x1, x2)
    val setTimestamp_ = fn x1 & x2 => (_import "gdk_app_launch_context_set_timestamp" : GdkAppLaunchContextClass.FFI.non_opt GdkAppLaunchContextClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GdkAppLaunchContextClass.class
    type 'a screen_class = 'a GdkScreenClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GdkAppLaunchContextClass.FFI.fromPtr true) new_ ()
    fun setDesktop self desktop = (GdkAppLaunchContextClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setDesktop_ (self & desktop)
    fun setDisplay self display = (GdkAppLaunchContextClass.FFI.withPtr false &&&> GdkDisplayClass.FFI.withPtr false ---> I) setDisplay_ (self & display)
    fun setIcon self icon = (GdkAppLaunchContextClass.FFI.withPtr false &&&> GioIconClass.FFI.withOptPtr false ---> I) setIcon_ (self & icon)
    fun setIconName self iconName = (GdkAppLaunchContextClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setIconName_ (self & iconName)
    fun setScreen self screen = (GdkAppLaunchContextClass.FFI.withPtr false &&&> GdkScreenClass.FFI.withPtr false ---> I) setScreen_ (self & screen)
    fun setTimestamp self timestamp = (GdkAppLaunchContextClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setTimestamp_ (self & timestamp)
    local
      open ValueAccessor
    in
      val displayProp =
        {
          name = "display",
          gtype = fn () => C.gtype GdkDisplayClass.tOpt (),
          get = fn x => fn () => C.get GdkDisplayClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkDisplayClass.tOpt x
        }
    end
  end
