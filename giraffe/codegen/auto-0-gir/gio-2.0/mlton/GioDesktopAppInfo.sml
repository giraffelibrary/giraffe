structure GioDesktopAppInfo :>
  GIO_DESKTOP_APP_INFO
    where type 'a class = 'a GioDesktopAppInfoClass.class
    where type 'a app_info_class = 'a GioAppInfoClass.class
    where type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    structure Utf8CVectorCVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8CVector.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorCVector = CVector(Utf8CVectorCVectorType)
    val getType_ = _import "g_desktop_app_info_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_g_desktop_app_info_new" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p;
    val newFromFilename_ = _import "mlton_g_desktop_app_info_new_from_filename" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p;
    val newFromKeyfile_ = _import "g_desktop_app_info_new_from_keyfile" : GLibKeyFileRecord.FFI.notnull GLibKeyFileRecord.FFI.p -> GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p;
    val search_ = _import "mlton_g_desktop_app_info_search" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> Utf8CVectorCVector.FFI.notnull Utf8CVectorCVector.FFI.out_p;
    val setDesktopEnv_ = _import "mlton_g_desktop_app_info_set_desktop_env" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val getActionName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_desktop_app_info_get_action_name" :
              GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getBoolean_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_desktop_app_info_get_boolean" :
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
    val getCategories_ = _import "g_desktop_app_info_get_categories" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getFilename_ = _import "g_desktop_app_info_get_filename" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getGenericName_ = _import "g_desktop_app_info_get_generic_name" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getIsHidden_ = _import "g_desktop_app_info_get_is_hidden" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> GBool.FFI.val_;
    val getKeywords_ = _import "g_desktop_app_info_get_keywords" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getNodisplay_ = _import "g_desktop_app_info_get_nodisplay" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> GBool.FFI.val_;
    val getShowIn_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_desktop_app_info_get_show_in" :
              GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getStartupWmClass_ = _import "g_desktop_app_info_get_startup_wm_class" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getString_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_desktop_app_info_get_string" :
              GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val hasKey_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_desktop_app_info_has_key" :
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
    val launchAction_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_desktop_app_info_launch_action" :
              GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioAppLaunchContextClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val listActions_ = _import "g_desktop_app_info_list_actions" : GioDesktopAppInfoClass.FFI.notnull GioDesktopAppInfoClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    type 'a class = 'a GioDesktopAppInfoClass.class
    type 'a app_info_class = 'a GioAppInfoClass.class
    type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class
    type t = base class
    fun asAppInfo self = (GObjectObjectClass.FFI.withPtr ---> GioAppInfoClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new desktopId = (Utf8.FFI.withPtr ---> GioDesktopAppInfoClass.FFI.fromPtr true) new_ desktopId
    fun newFromFilename filename = (Utf8.FFI.withPtr ---> GioDesktopAppInfoClass.FFI.fromPtr true) newFromFilename_ filename
    fun newFromKeyfile keyFile = (GLibKeyFileRecord.FFI.withPtr ---> GioDesktopAppInfoClass.FFI.fromPtr true) newFromKeyfile_ keyFile
    fun search searchString = (Utf8.FFI.withPtr ---> Utf8CVectorCVector.FFI.fromPtr 3) search_ searchString
    fun setDesktopEnv desktopEnv = (Utf8.FFI.withPtr ---> I) setDesktopEnv_ desktopEnv
    fun getActionName self actionName = (GioDesktopAppInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getActionName_ (self & actionName)
    fun getBoolean self key = (GioDesktopAppInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) getBoolean_ (self & key)
    fun getCategories self = (GioDesktopAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCategories_ self
    fun getFilename self = (GioDesktopAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getFilename_ self
    fun getGenericName self = (GioDesktopAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getGenericName_ self
    fun getIsHidden self = (GioDesktopAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsHidden_ self
    fun getKeywords self = (GioDesktopAppInfoClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getKeywords_ self
    fun getNodisplay self = (GioDesktopAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) getNodisplay_ self
    fun getShowIn self desktopEnv = (GioDesktopAppInfoClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> GBool.FFI.fromVal) getShowIn_ (self & desktopEnv)
    fun getStartupWmClass self = (GioDesktopAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStartupWmClass_ self
    fun getString self key = (GioDesktopAppInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getString_ (self & key)
    fun hasKey self key = (GioDesktopAppInfoClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasKey_ (self & key)
    fun launchAction self (actionName, launchContext) =
      (
        GioDesktopAppInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioAppLaunchContextClass.FFI.withOptPtr
         ---> I
      )
        launchAction_
        (
          self
           & actionName
           & launchContext
        )
    fun listActions self = (GioDesktopAppInfoClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) listActions_ self
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
