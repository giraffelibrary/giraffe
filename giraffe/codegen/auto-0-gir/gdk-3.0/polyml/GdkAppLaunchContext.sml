structure GdkAppLaunchContext :>
  GDK_APP_LAUNCH_CONTEXT
    where type 'a class = 'a GdkAppLaunchContextClass.class
    where type 'a screen_class = 'a GdkScreenClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_app_launch_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val setDesktop_ = call (load_sym libgdk "gdk_app_launch_context_set_desktop") (GdkAppLaunchContextClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setIcon_ = call (load_sym libgdk "gdk_app_launch_context_set_icon") (GdkAppLaunchContextClass.PolyML.cPtr &&> GioIconClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setIconName_ = call (load_sym libgdk "gdk_app_launch_context_set_icon_name") (GdkAppLaunchContextClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setScreen_ = call (load_sym libgdk "gdk_app_launch_context_set_screen") (GdkAppLaunchContextClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setTimestamp_ = call (load_sym libgdk "gdk_app_launch_context_set_timestamp") (GdkAppLaunchContextClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GdkAppLaunchContextClass.class
    type 'a screen_class = 'a GdkScreenClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun setDesktop self desktop = (GdkAppLaunchContextClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setDesktop_ (self & desktop)
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
