structure GioDesktopAppInfo :>
  GIO_DESKTOP_APP_INFO
    where type 'a class_t = 'a GioDesktopAppInfoClass.t
    where type 'a app_info_class_t = 'a GioAppInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_desktop_app_info_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_desktop_app_info_new") (Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newFromFilename_ = call (load_sym libgio "g_desktop_app_info_new_from_filename") (Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newFromKeyfile_ = call (load_sym libgio "g_desktop_app_info_new_from_keyfile") (GLibKeyFileRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setDesktopEnv_ = call (load_sym libgio "g_desktop_app_info_set_desktop_env") (Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val getCategories_ = call (load_sym libgio "g_desktop_app_info_get_categories") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getFilename_ = call (load_sym libgio "g_desktop_app_info_get_filename") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getGenericName_ = call (load_sym libgio "g_desktop_app_info_get_generic_name") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getIsHidden_ = call (load_sym libgio "g_desktop_app_info_get_is_hidden") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getNodisplay_ = call (load_sym libgio "g_desktop_app_info_get_nodisplay") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShowIn_ = call (load_sym libgio "g_desktop_app_info_get_show_in") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GioDesktopAppInfoClass.t
    type 'a app_info_class_t = 'a GioAppInfoClass.t
    type t = base class_t
    fun asAppInfo self = (GObjectObjectClass.C.withPtr ---> GioAppInfoClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new desktopId = (Utf8.C.withPtr ---> GioDesktopAppInfoClass.C.fromPtr true) new_ desktopId
    fun newFromFilename filename = (Utf8.C.withPtr ---> GioDesktopAppInfoClass.C.fromPtr true) newFromFilename_ filename
    fun newFromKeyfile keyFile = (GLibKeyFileRecord.C.withPtr ---> GioDesktopAppInfoClass.C.fromPtr true) newFromKeyfile_ keyFile
    fun setDesktopEnv desktopEnv = (Utf8.C.withPtr ---> I) setDesktopEnv_ desktopEnv
    fun getCategories self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getCategories_ self
    fun getFilename self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getFilename_ self
    fun getGenericName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getGenericName_ self
    fun getIsHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsHidden_ self
    fun getNodisplay self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getNodisplay_ self
    fun getShowIn self desktopEnv = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getShowIn_ (self & desktopEnv)
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
