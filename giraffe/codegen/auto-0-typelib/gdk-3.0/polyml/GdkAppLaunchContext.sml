structure GdkAppLaunchContext :>
  GDK_APP_LAUNCH_CONTEXT
    where type 'a class_t = 'a GdkAppLaunchContextClass.t
    where type 'a screen_class_t = 'a GdkScreenClass.t
    where type 'a display_class_t = 'a GdkDisplayClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_app_launch_context_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val setDesktop_ = call (load_sym libgdk "gdk_app_launch_context_set_desktop") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setIcon_ = call (load_sym libgdk "gdk_app_launch_context_set_icon") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setIconName_ = call (load_sym libgdk "gdk_app_launch_context_set_icon_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setScreen_ = call (load_sym libgdk "gdk_app_launch_context_set_screen") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setTimestamp_ = call (load_sym libgdk "gdk_app_launch_context_set_timestamp") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GdkAppLaunchContextClass.t
    type 'a screen_class_t = 'a GdkScreenClass.t
    type 'a display_class_t = 'a GdkDisplayClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun setDesktop self desktop = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setDesktop_ (self & desktop)
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
