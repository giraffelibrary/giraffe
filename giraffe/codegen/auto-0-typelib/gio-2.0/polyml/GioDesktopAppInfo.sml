structure GioDesktopAppInfo :>
  GIO_DESKTOP_APP_INFO
    where type 'a class = 'a GioDesktopAppInfoClass.class
    where type 'a app_info_class = 'a GioAppInfoClass.class
    where type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_desktop_app_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_desktop_app_info_new") (Utf8.PolyML.cInPtr --> GioDesktopAppInfoClass.PolyML.cPtr)
      val newFromFilename_ = call (getSymbol "g_desktop_app_info_new_from_filename") (Utf8.PolyML.cInPtr --> GioDesktopAppInfoClass.PolyML.cPtr)
      val newFromKeyfile_ = call (getSymbol "g_desktop_app_info_new_from_keyfile") (GLibKeyFileRecord.PolyML.cPtr --> GioDesktopAppInfoClass.PolyML.cPtr)
      val search_ = call (getSymbol "g_desktop_app_info_search") (Utf8.PolyML.cInPtr --> Utf8CPtrArrayCPtrArray.PolyML.cOutPtr)
      val setDesktopEnv_ = call (getSymbol "g_desktop_app_info_set_desktop_env") (Utf8.PolyML.cInPtr --> cVoid)
      val getActionName_ = call (getSymbol "g_desktop_app_info_get_action_name") (GioDesktopAppInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getBoolean_ = call (getSymbol "g_desktop_app_info_get_boolean") (GioDesktopAppInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val getCategories_ = call (getSymbol "g_desktop_app_info_get_categories") (GioDesktopAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFilename_ = call (getSymbol "g_desktop_app_info_get_filename") (GioDesktopAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getGenericName_ = call (getSymbol "g_desktop_app_info_get_generic_name") (GioDesktopAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIsHidden_ = call (getSymbol "g_desktop_app_info_get_is_hidden") (GioDesktopAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getKeywords_ = call (getSymbol "g_desktop_app_info_get_keywords") (GioDesktopAppInfoClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val getNodisplay_ = call (getSymbol "g_desktop_app_info_get_nodisplay") (GioDesktopAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowIn_ = call (getSymbol "g_desktop_app_info_get_show_in") (GioDesktopAppInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> GBool.PolyML.cVal)
      val getStartupWmClass_ = call (getSymbol "g_desktop_app_info_get_startup_wm_class") (GioDesktopAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getString_ = call (getSymbol "g_desktop_app_info_get_string") (GioDesktopAppInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val hasKey_ = call (getSymbol "g_desktop_app_info_has_key") (GioDesktopAppInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val launchAction_ =
        call (getSymbol "g_desktop_app_info_launch_action")
          (
            GioDesktopAppInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioAppLaunchContextClass.PolyML.cOptPtr
             --> cVoid
          )
      val listActions_ = call (getSymbol "g_desktop_app_info_list_actions") (GioDesktopAppInfoClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
    end
    type 'a class = 'a GioDesktopAppInfoClass.class
    type 'a app_info_class = 'a GioAppInfoClass.class
    type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class
    type t = base class
    fun asAppInfo self = (GObjectObjectClass.FFI.withPtr false ---> GioAppInfoClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new desktopId = (Utf8.FFI.withPtr 0 ---> GioDesktopAppInfoClass.FFI.fromPtr true) new_ desktopId
    fun newFromFilename filename = (Utf8.FFI.withPtr 0 ---> GioDesktopAppInfoClass.FFI.fromPtr true) newFromFilename_ filename
    fun newFromKeyfile keyFile = (GLibKeyFileRecord.FFI.withPtr false ---> GioDesktopAppInfoClass.FFI.fromPtr true) newFromKeyfile_ keyFile
    fun search searchString = (Utf8.FFI.withPtr 0 ---> Utf8CPtrArrayCPtrArray.FFI.fromPtr ~1) search_ searchString
    fun setDesktopEnv desktopEnv = (Utf8.FFI.withPtr 0 ---> I) setDesktopEnv_ desktopEnv
    fun getActionName self actionName = (GioDesktopAppInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) getActionName_ (self & actionName)
    fun getBoolean self key = (GioDesktopAppInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) getBoolean_ (self & key)
    fun getCategories self = (GioDesktopAppInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCategories_ self
    fun getFilename self = (GioDesktopAppInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getFilename_ self
    fun getGenericName self = (GioDesktopAppInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getGenericName_ self
    fun getIsHidden self = (GioDesktopAppInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsHidden_ self
    fun getKeywords self = (GioDesktopAppInfoClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getKeywords_ self
    fun getNodisplay self = (GioDesktopAppInfoClass.FFI.withPtr false ---> GBool.FFI.fromVal) getNodisplay_ self
    fun getShowIn self desktopEnv = (GioDesktopAppInfoClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GBool.FFI.fromVal) getShowIn_ (self & desktopEnv)
    fun getStartupWmClass self = (GioDesktopAppInfoClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getStartupWmClass_ self
    fun getString self key = (GioDesktopAppInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromPtr ~1) getString_ (self & key)
    fun hasKey self key = (GioDesktopAppInfoClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasKey_ (self & key)
    fun launchAction self (actionName, launchContext) =
      (
        GioDesktopAppInfoClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioAppLaunchContextClass.FFI.withOptPtr false
         ---> I
      )
        launchAction_
        (
          self
           & actionName
           & launchContext
        )
    fun listActions self = (GioDesktopAppInfoClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) listActions_ self
    local
      open Property
    in
      val filenameProp =
        {
          get = fn x => get "filename" stringOpt x,
          new = fn x => new "filename" stringOpt x
        }
    end
  end
