structure GdkAppLaunchContext :>
  GDK_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GdkAppLaunchContextClass.class
    where type 'a screen_class = 'a GdkScreenClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_app_launch_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gdk_app_launch_context_new") (cVoid --> GdkAppLaunchContextClass.PolyML.cPtr)
      val setDesktop_ = call (getSymbol "gdk_app_launch_context_set_desktop") (GdkAppLaunchContextClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setDisplay_ = call (getSymbol "gdk_app_launch_context_set_display") (GdkAppLaunchContextClass.PolyML.cPtr &&> GdkDisplayClass.PolyML.cPtr --> cVoid)
      val setIcon_ = call (getSymbol "gdk_app_launch_context_set_icon") (GdkAppLaunchContextClass.PolyML.cPtr &&> GioIconClass.PolyML.cOptPtr --> cVoid)
      val setIconName_ = call (getSymbol "gdk_app_launch_context_set_icon_name") (GdkAppLaunchContextClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setScreen_ = call (getSymbol "gdk_app_launch_context_set_screen") (GdkAppLaunchContextClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> cVoid)
      val setTimestamp_ = call (getSymbol "gdk_app_launch_context_set_timestamp") (GdkAppLaunchContextClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
    end
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
