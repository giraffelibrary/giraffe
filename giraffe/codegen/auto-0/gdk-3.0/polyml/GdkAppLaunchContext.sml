structure GdkAppLaunchContext :>
  GDK_APP_LAUNCH_CONTEXT
    where type 'a class_t = 'a GdkAppLaunchContextClass.t
    where type 'a screenclass_t = 'a GdkScreenClass.t
    where type 'a displayclass_t = 'a GdkDisplayClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_app_launch_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val setDesktop_ = call (load_sym libgdk "gdk_app_launch_context_set_desktop") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setIcon_ = call (load_sym libgdk "gdk_app_launch_context_set_icon") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setIconName_ = call (load_sym libgdk "gdk_app_launch_context_set_icon_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val setScreen_ = call (load_sym libgdk "gdk_app_launch_context_set_screen") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setTimestamp_ = call (load_sym libgdk "gdk_app_launch_context_set_timestamp") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.UInt32.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GdkAppLaunchContextClass.t
    type 'a screenclass_t = 'a GdkScreenClass.t
    type 'a displayclass_t = 'a GdkDisplayClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun setDesktop self desktop = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setDesktop_ (self & desktop)
    fun setIcon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setIcon_ (self & icon)
    fun setIconName self iconName = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setIconName_ (self & iconName)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setTimestamp self timestamp = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.withVal ---> I) setTimestamp_ (self & timestamp)
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
