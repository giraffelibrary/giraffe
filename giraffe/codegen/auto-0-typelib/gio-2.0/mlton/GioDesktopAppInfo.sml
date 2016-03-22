structure GioDesktopAppInfo :>
  GIO_DESKTOP_APP_INFO
    where type 'a class = 'a GioDesktopAppInfoClass.class
    where type 'a app_info_class = 'a GioAppInfoClass.class =
  struct
    val getType_ = _import "g_desktop_app_info_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_desktop_app_info_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioDesktopAppInfoClass.C.notnull GioDesktopAppInfoClass.C.p;
    val newFromFilename_ = _import "mlton_g_desktop_app_info_new_from_filename" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioDesktopAppInfoClass.C.notnull GioDesktopAppInfoClass.C.p;
    val newFromKeyfile_ = _import "g_desktop_app_info_new_from_keyfile" : GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p -> GioDesktopAppInfoClass.C.notnull GioDesktopAppInfoClass.C.p;
    val setDesktopEnv_ = _import "mlton_g_desktop_app_info_set_desktop_env" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    val getCategories_ = _import "g_desktop_app_info_get_categories" : GioDesktopAppInfoClass.C.notnull GioDesktopAppInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFilename_ = _import "g_desktop_app_info_get_filename" : GioDesktopAppInfoClass.C.notnull GioDesktopAppInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getGenericName_ = _import "g_desktop_app_info_get_generic_name" : GioDesktopAppInfoClass.C.notnull GioDesktopAppInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getIsHidden_ = _import "g_desktop_app_info_get_is_hidden" : GioDesktopAppInfoClass.C.notnull GioDesktopAppInfoClass.C.p -> FFI.Bool.C.val_;
    val getNodisplay_ = _import "g_desktop_app_info_get_nodisplay" : GioDesktopAppInfoClass.C.notnull GioDesktopAppInfoClass.C.p -> FFI.Bool.C.val_;
    val getShowIn_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_desktop_app_info_get_show_in" :
              GioDesktopAppInfoClass.C.notnull GioDesktopAppInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDesktopAppInfoClass.class
    type 'a app_info_class = 'a GioAppInfoClass.class
    type t = base class
    fun asAppInfo self = (GObjectObjectClass.C.withPtr ---> GioAppInfoClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new desktopId = (Utf8.C.withPtr ---> GioDesktopAppInfoClass.C.fromPtr true) new_ desktopId
    fun newFromFilename filename = (Utf8.C.withPtr ---> GioDesktopAppInfoClass.C.fromPtr true) newFromFilename_ filename
    fun newFromKeyfile keyFile = (GLibKeyFileRecord.C.withPtr ---> GioDesktopAppInfoClass.C.fromPtr true) newFromKeyfile_ keyFile
    fun setDesktopEnv desktopEnv = (Utf8.C.withPtr ---> I) setDesktopEnv_ desktopEnv
    fun getCategories self = (GioDesktopAppInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getCategories_ self
    fun getFilename self = (GioDesktopAppInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getFilename_ self
    fun getGenericName self = (GioDesktopAppInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getGenericName_ self
    fun getIsHidden self = (GioDesktopAppInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsHidden_ self
    fun getNodisplay self = (GioDesktopAppInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) getNodisplay_ self
    fun getShowIn self desktopEnv = (GioDesktopAppInfoClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) getShowIn_ (self & desktopEnv)
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
