structure GioDesktopAppInfo :>
  GIO_DESKTOP_APP_INFO
    where type 'a class = 'a GioDesktopAppInfoClass.class
    where type 'a app_info_class = 'a GioAppInfoClass.class =
  struct
    val getType_ = _import "g_desktop_app_info_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_desktop_app_info_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p;
    val newFromFilename_ = _import "mlton_g_desktop_app_info_new_from_filename" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p;
    val newFromKeyfile_ = _import "g_desktop_app_info_new_from_keyfile" : GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p -> GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p;
    val setDesktopEnv_ = _import "mlton_g_desktop_app_info_set_desktop_env" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val getCategories_ = _import "g_desktop_app_info_get_categories" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getFilename_ = _import "g_desktop_app_info_get_filename" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getGenericName_ = _import "g_desktop_app_info_get_generic_name" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getIsHidden_ = _import "g_desktop_app_info_get_is_hidden" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> GBool.FFI.val_;
    val getNodisplay_ = _import "g_desktop_app_info_get_nodisplay" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> GBool.FFI.val_;
    val getShowIn_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_desktop_app_info_get_show_in" :
              GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
