structure GioDesktopAppInfo :>
  GIO_DESKTOP_APP_INFO
    where type 'a class = 'a GioDesktopAppInfoClass.class
    where type 'a app_info_class = 'a GioAppInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_desktop_app_info_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_desktop_app_info_new") (Utf8.PolyML.cInPtr --> GioDesktopAppInfoClass.PolyML.cPtr)
      val newFromFilename_ = call (load_sym libgio "g_desktop_app_info_new_from_filename") (Utf8.PolyML.cInPtr --> GioDesktopAppInfoClass.PolyML.cPtr)
      val newFromKeyfile_ = call (load_sym libgio "g_desktop_app_info_new_from_keyfile") (GLibKeyFileRecord.PolyML.cPtr --> GioDesktopAppInfoClass.PolyML.cPtr)
      val setDesktopEnv_ = call (load_sym libgio "g_desktop_app_info_set_desktop_env") (Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val getCategories_ = call (load_sym libgio "g_desktop_app_info_get_categories") (GioDesktopAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFilename_ = call (load_sym libgio "g_desktop_app_info_get_filename") (GioDesktopAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getGenericName_ = call (load_sym libgio "g_desktop_app_info_get_generic_name") (GioDesktopAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIsHidden_ = call (load_sym libgio "g_desktop_app_info_get_is_hidden") (GioDesktopAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getNodisplay_ = call (load_sym libgio "g_desktop_app_info_get_nodisplay") (GioDesktopAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowIn_ = call (load_sym libgio "g_desktop_app_info_get_show_in") (GioDesktopAppInfoClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioDesktopAppInfoClass.class
    type 'a app_info_class = 'a GioAppInfoClass.class
    type t = base class
    fun asAppInfo self = (GObjectObjectClass.FFI.withPtr ---> GioAppInfoClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new desktopId = (Utf8.FFI.withPtr ---> GioDesktopAppInfoClass.FFI.fromPtr true) new_ desktopId
    fun newFromFilename filename = (Utf8.FFI.withPtr ---> GioDesktopAppInfoClass.FFI.fromPtr true) newFromFilename_ filename
    fun newFromKeyfile keyFile = (GLibKeyFileRecord.FFI.withPtr ---> GioDesktopAppInfoClass.FFI.fromPtr true) newFromKeyfile_ keyFile
    fun setDesktopEnv desktopEnv = (Utf8.FFI.withPtr ---> I) setDesktopEnv_ desktopEnv
    fun getCategories self = (GioDesktopAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCategories_ self
    fun getFilename self = (GioDesktopAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFilename_ self
    fun getGenericName self = (GioDesktopAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getGenericName_ self
    fun getIsHidden self = (GioDesktopAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsHidden_ self
    fun getNodisplay self = (GioDesktopAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) getNodisplay_ self
    fun getShowIn self desktopEnv = (GioDesktopAppInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) getShowIn_ (self & desktopEnv)
    local
      open Property
    in
      val filenameProp =
        {
          get = fn x => get "filename" stringOpt x,
          set = fn x => set "filename" stringOpt x
        }
    end
  end
