structure GtkApplication :>
  GTK_APPLICATION
    where type 'a class = 'a GtkApplicationClass.class
    where type application_inhibit_flags_t = GtkApplicationInhibitFlags.t
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_application_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_application_new") (Utf8.PolyML.cInOptPtr &&> GioApplicationFlags.PolyML.cVal --> GtkApplicationClass.PolyML.cPtr)
      val addAccelerator_ =
        call (getSymbol "gtk_application_add_accelerator")
          (
            GtkApplicationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> cVoid
          )
      val addWindow_ = call (getSymbol "gtk_application_add_window") (GtkApplicationClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> cVoid)
      val getAccelsForAction_ = call (getSymbol "gtk_application_get_accels_for_action") (GtkApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8CArray.PolyML.cOutPtr)
      val getActionsForAccel_ = call (getSymbol "gtk_application_get_actions_for_accel") (GtkApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8CArray.PolyML.cOutPtr)
      val getActiveWindow_ = call (getSymbol "gtk_application_get_active_window") (GtkApplicationClass.PolyML.cPtr --> GtkWindowClass.PolyML.cOptPtr)
      val getAppMenu_ = call (getSymbol "gtk_application_get_app_menu") (GtkApplicationClass.PolyML.cPtr --> GioMenuModelClass.PolyML.cOptPtr)
      val getMenuById_ = call (getSymbol "gtk_application_get_menu_by_id") (GtkApplicationClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioMenuClass.PolyML.cPtr)
      val getMenubar_ = call (getSymbol "gtk_application_get_menubar") (GtkApplicationClass.PolyML.cPtr --> GioMenuModelClass.PolyML.cPtr)
      val getWindowById_ = call (getSymbol "gtk_application_get_window_by_id") (GtkApplicationClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> GtkWindowClass.PolyML.cOptPtr)
      val inhibit_ =
        call (getSymbol "gtk_application_inhibit")
          (
            GtkApplicationClass.PolyML.cPtr
             &&> GtkWindowClass.PolyML.cOptPtr
             &&> GtkApplicationInhibitFlags.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> GUInt32.PolyML.cVal
          )
      val isInhibited_ = call (getSymbol "gtk_application_is_inhibited") (GtkApplicationClass.PolyML.cPtr &&> GtkApplicationInhibitFlags.PolyML.cVal --> GBool.PolyML.cVal)
      val listActionDescriptions_ = call (getSymbol "gtk_application_list_action_descriptions") (GtkApplicationClass.PolyML.cPtr --> Utf8CArray.PolyML.cOutPtr)
      val prefersAppMenu_ = call (getSymbol "gtk_application_prefers_app_menu") (GtkApplicationClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val removeAccelerator_ =
        call (getSymbol "gtk_application_remove_accelerator")
          (
            GtkApplicationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             --> cVoid
          )
      val removeWindow_ = call (getSymbol "gtk_application_remove_window") (GtkApplicationClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> cVoid)
      val setAccelsForAction_ =
        call (getSymbol "gtk_application_set_accels_for_action")
          (
            GtkApplicationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8CArray.PolyML.cInPtr
             --> cVoid
          )
      val setAppMenu_ = call (getSymbol "gtk_application_set_app_menu") (GtkApplicationClass.PolyML.cPtr &&> GioMenuModelClass.PolyML.cOptPtr --> cVoid)
      val setMenubar_ = call (getSymbol "gtk_application_set_menubar") (GtkApplicationClass.PolyML.cPtr &&> GioMenuModelClass.PolyML.cOptPtr --> cVoid)
      val uninhibit_ = call (getSymbol "gtk_application_uninhibit") (GtkApplicationClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkApplicationClass.class
    type application_inhibit_flags_t = GtkApplicationInhibitFlags.t
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asActionMap self = (GObjectObjectClass.FFI.withPtr ---> GioActionMapClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (applicationId, flags) = (Utf8.FFI.withOptPtr &&&> GioApplicationFlags.FFI.withVal ---> GtkApplicationClass.FFI.fromPtr true) new_ (applicationId & flags)
    fun addAccelerator
      self
      (
        accelerator,
        actionName,
        parameter
      ) =
      (
        GtkApplicationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        addAccelerator_
        (
          self
           & accelerator
           & actionName
           & parameter
        )
    fun addWindow self window = (GtkApplicationClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) addWindow_ (self & window)
    fun getAccelsForAction self detailedActionName = (GtkApplicationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8CArray.FFI.fromPtr 2) getAccelsForAction_ (self & detailedActionName)
    fun getActionsForAccel self accel = (GtkApplicationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8CArray.FFI.fromPtr 2) getActionsForAccel_ (self & accel)
    fun getActiveWindow self = (GtkApplicationClass.FFI.withPtr ---> GtkWindowClass.FFI.fromOptPtr false) getActiveWindow_ self
    fun getAppMenu self = (GtkApplicationClass.FFI.withPtr ---> GioMenuModelClass.FFI.fromOptPtr false) getAppMenu_ self
    fun getMenuById self id = (GtkApplicationClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioMenuClass.FFI.fromPtr false) getMenuById_ (self & id)
    fun getMenubar self = (GtkApplicationClass.FFI.withPtr ---> GioMenuModelClass.FFI.fromPtr false) getMenubar_ self
    fun getWindowById self id = (GtkApplicationClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GtkWindowClass.FFI.fromOptPtr false) getWindowById_ (self & id)
    fun inhibit
      self
      (
        window,
        flags,
        reason
      ) =
      (
        GtkApplicationClass.FFI.withPtr
         &&&> GtkWindowClass.FFI.withOptPtr
         &&&> GtkApplicationInhibitFlags.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         ---> GUInt32.FFI.fromVal
      )
        inhibit_
        (
          self
           & window
           & flags
           & reason
        )
    fun isInhibited self flags = (GtkApplicationClass.FFI.withPtr &&&> GtkApplicationInhibitFlags.FFI.withVal ---> GBool.FFI.fromVal) isInhibited_ (self & flags)
    fun listActionDescriptions self = (GtkApplicationClass.FFI.withPtr ---> Utf8CArray.FFI.fromPtr 2) listActionDescriptions_ self
    fun prefersAppMenu self = (GtkApplicationClass.FFI.withPtr ---> GBool.FFI.fromVal) prefersAppMenu_ self
    fun removeAccelerator self (actionName, parameter) =
      (
        GtkApplicationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        removeAccelerator_
        (
          self
           & actionName
           & parameter
        )
    fun removeWindow self window = (GtkApplicationClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) removeWindow_ (self & window)
    fun setAccelsForAction self (detailedActionName, accels) =
      (
        GtkApplicationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8CArray.FFI.withPtr
         ---> I
      )
        setAccelsForAction_
        (
          self
           & detailedActionName
           & accels
        )
    fun setAppMenu self appMenu = (GtkApplicationClass.FFI.withPtr &&&> GioMenuModelClass.FFI.withOptPtr ---> I) setAppMenu_ (self & appMenu)
    fun setMenubar self menubar = (GtkApplicationClass.FFI.withPtr &&&> GioMenuModelClass.FFI.withOptPtr ---> I) setMenubar_ (self & menubar)
    fun uninhibit self cookie = (GtkApplicationClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) uninhibit_ (self & cookie)
    local
      open ClosureMarshal Signal
    in
      fun windowAddedSig f = signal "window-added" (get 0w1 GtkWindowClass.t ---> ret_void) f
      fun windowRemovedSig f = signal "window-removed" (get 0w1 GtkWindowClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val activeWindowProp = {get = fn x => get "active-window" GtkWindowClass.tOpt x}
      val appMenuProp =
        {
          get = fn x => get "app-menu" GioMenuModelClass.tOpt x,
          set = fn x => set "app-menu" GioMenuModelClass.tOpt x,
          new = fn x => new "app-menu" GioMenuModelClass.tOpt x
        }
      val menubarProp =
        {
          get = fn x => get "menubar" GioMenuModelClass.tOpt x,
          set = fn x => set "menubar" GioMenuModelClass.tOpt x,
          new = fn x => new "menubar" GioMenuModelClass.tOpt x
        }
      val registerSessionProp =
        {
          get = fn x => get "register-session" boolean x,
          set = fn x => set "register-session" boolean x,
          new = fn x => new "register-session" boolean x
        }
    end
  end
