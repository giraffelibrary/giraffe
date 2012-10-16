structure GioDesktopAppInfo :>
  GIO_DESKTOP_APP_INFO
    where type 'a class_t = 'a GioDesktopAppInfoClass.t
    where type 'a appinfoclass_t = 'a GioAppInfoClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_desktop_app_info_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_desktop_app_info_new") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newFromFilename_ = call (load_sym libgio "g_desktop_app_info_new_from_filename") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newFromKeyfile_ = call (load_sym libgio "g_desktop_app_info_new_from_keyfile") (GLibKeyFileRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setDesktopEnv_ = call (load_sym libgio "g_desktop_app_info_set_desktop_env") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val getCategories_ = call (load_sym libgio "g_desktop_app_info_get_categories") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getFilename_ = call (load_sym libgio "g_desktop_app_info_get_filename") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getGenericName_ = call (load_sym libgio "g_desktop_app_info_get_generic_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getIsHidden_ = call (load_sym libgio "g_desktop_app_info_get_is_hidden") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getNodisplay_ = call (load_sym libgio "g_desktop_app_info_get_nodisplay") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getShowIn_ = call (load_sym libgio "g_desktop_app_info_get_show_in") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a GioDesktopAppInfoClass.t
    type 'a appinfoclass_t = 'a GioAppInfoClass.t
    fun asAppInfo self = (GObjectObjectClass.C.withPtr ---> GioAppInfoClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new desktopId = (FFI.String.withConstPtr ---> GioDesktopAppInfoClass.C.fromPtr true) new_ desktopId
    fun newFromFilename filename = (FFI.String.withConstPtr ---> GioDesktopAppInfoClass.C.fromPtr true) newFromFilename_ filename
    fun newFromKeyfile keyFile = (GLibKeyFileRecord.C.withPtr ---> GioDesktopAppInfoClass.C.fromPtr true) newFromKeyfile_ keyFile
    fun setDesktopEnv desktopEnv = (FFI.String.withConstPtr ---> I) setDesktopEnv_ desktopEnv
    fun getCategories self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getCategories_ self
    fun getFilename self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getFilename_ self
    fun getGenericName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getGenericName_ self
    fun getIsHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsHidden_ self
    fun getNodisplay self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getNodisplay_ self
    fun getShowIn self desktopEnv = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) getShowIn_ (self & desktopEnv)
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
