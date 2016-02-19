structure GioDesktopAppInfo :>
  GIO_DESKTOP_APP_INFO
    where type 'a class_t = 'a GioDesktopAppInfoClass.t
    where type 'a app_info_class_t = 'a GioAppInfoClass.t =
  struct
    val getType_ = _import "g_desktop_app_info_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_g_desktop_app_info_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromFilename_ = _import "mlton_g_desktop_app_info_new_from_filename" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromKeyfile_ = _import "g_desktop_app_info_new_from_keyfile" : GLibKeyFileRecord.C.notnull GLibKeyFileRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setDesktopEnv_ = _import "mlton_g_desktop_app_info_set_desktop_env" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    val getCategories_ = _import "g_desktop_app_info_get_categories" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getFilename_ = _import "g_desktop_app_info_get_filename" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getGenericName_ = _import "g_desktop_app_info_get_generic_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getIsHidden_ = _import "g_desktop_app_info_get_is_hidden" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getNodisplay_ = _import "g_desktop_app_info_get_nodisplay" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getShowIn_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_desktop_app_info_get_show_in" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
