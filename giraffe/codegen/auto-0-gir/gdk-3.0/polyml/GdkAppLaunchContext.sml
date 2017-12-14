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
      val setDesktop_ = call (getSymbol "gdk_app_launch_context_set_desktop") (GdkAppLaunchContextClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
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
    fun setDesktop self desktop = (GdkAppLaunchContextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setDesktop_ (self & desktop)
    fun setDisplay self display = (GdkAppLaunchContextClass.FFI.withPtr &&&> GdkDisplayClass.FFI.withPtr ---> I) setDisplay_ (self & display)
    fun setIcon self icon = (GdkAppLaunchContextClass.FFI.withPtr &&&> GioIconClass.FFI.withOptPtr ---> I) setIcon_ (self & icon)
    fun setIconName self iconName = (GdkAppLaunchContextClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setIconName_ (self & iconName)
    fun setScreen self screen = (GdkAppLaunchContextClass.FFI.withPtr &&&> GdkScreenClass.FFI.withPtr ---> I) setScreen_ (self & screen)
    fun setTimestamp self timestamp = (GdkAppLaunchContextClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setTimestamp_ (self & timestamp)
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
