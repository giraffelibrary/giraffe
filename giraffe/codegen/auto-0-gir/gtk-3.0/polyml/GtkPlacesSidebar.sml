structure GtkPlacesSidebar :>
  GTK_PLACES_SIDEBAR
    where type 'a class = 'a GtkPlacesSidebarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type places_open_flags_t = GtkPlacesOpenFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_places_sidebar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_places_sidebar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addShortcut_ = call (getSymbol "gtk_places_sidebar_add_shortcut") (GtkPlacesSidebarClass.PolyML.cPtr &&> GioFileClass.PolyML.cPtr --> cVoid)
      val getLocalOnly_ = call (getSymbol "gtk_places_sidebar_get_local_only") (GtkPlacesSidebarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLocation_ = call (getSymbol "gtk_places_sidebar_get_location") (GtkPlacesSidebarClass.PolyML.cPtr --> GioFileClass.PolyML.cPtr)
      val getNthBookmark_ = call (getSymbol "gtk_places_sidebar_get_nth_bookmark") (GtkPlacesSidebarClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GioFileClass.PolyML.cPtr)
      val getOpenFlags_ = call (getSymbol "gtk_places_sidebar_get_open_flags") (GtkPlacesSidebarClass.PolyML.cPtr --> GtkPlacesOpenFlags.PolyML.cVal)
      val getShowConnectToServer_ = call (getSymbol "gtk_places_sidebar_get_show_connect_to_server") (GtkPlacesSidebarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowDesktop_ = call (getSymbol "gtk_places_sidebar_get_show_desktop") (GtkPlacesSidebarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowEnterLocation_ = call (getSymbol "gtk_places_sidebar_get_show_enter_location") (GtkPlacesSidebarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowOtherLocations_ = call (getSymbol "gtk_places_sidebar_get_show_other_locations") (GtkPlacesSidebarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowRecent_ = call (getSymbol "gtk_places_sidebar_get_show_recent") (GtkPlacesSidebarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShowTrash_ = call (getSymbol "gtk_places_sidebar_get_show_trash") (GtkPlacesSidebarClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val removeShortcut_ = call (getSymbol "gtk_places_sidebar_remove_shortcut") (GtkPlacesSidebarClass.PolyML.cPtr &&> GioFileClass.PolyML.cPtr --> cVoid)
      val setDropTargetsVisible_ =
        call (getSymbol "gtk_places_sidebar_set_drop_targets_visible")
          (
            GtkPlacesSidebarClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GdkDragContextClass.PolyML.cPtr
             --> cVoid
          )
      val setLocalOnly_ = call (getSymbol "gtk_places_sidebar_set_local_only") (GtkPlacesSidebarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setLocation_ = call (getSymbol "gtk_places_sidebar_set_location") (GtkPlacesSidebarClass.PolyML.cPtr &&> GioFileClass.PolyML.cOptPtr --> cVoid)
      val setOpenFlags_ = call (getSymbol "gtk_places_sidebar_set_open_flags") (GtkPlacesSidebarClass.PolyML.cPtr &&> GtkPlacesOpenFlags.PolyML.cVal --> cVoid)
      val setShowConnectToServer_ = call (getSymbol "gtk_places_sidebar_set_show_connect_to_server") (GtkPlacesSidebarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowDesktop_ = call (getSymbol "gtk_places_sidebar_set_show_desktop") (GtkPlacesSidebarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowEnterLocation_ = call (getSymbol "gtk_places_sidebar_set_show_enter_location") (GtkPlacesSidebarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowOtherLocations_ = call (getSymbol "gtk_places_sidebar_set_show_other_locations") (GtkPlacesSidebarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowRecent_ = call (getSymbol "gtk_places_sidebar_set_show_recent") (GtkPlacesSidebarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setShowTrash_ = call (getSymbol "gtk_places_sidebar_set_show_trash") (GtkPlacesSidebarClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkPlacesSidebarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type places_open_flags_t = GtkPlacesOpenFlags.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkPlacesSidebarClass.FFI.fromPtr false) new_ ()
    fun addShortcut self location = (GtkPlacesSidebarClass.FFI.withPtr &&&> GioFileClass.FFI.withPtr ---> I) addShortcut_ (self & location)
    fun getLocalOnly self = (GtkPlacesSidebarClass.FFI.withPtr ---> GBool.FFI.fromVal) getLocalOnly_ self
    fun getLocation self = (GtkPlacesSidebarClass.FFI.withPtr ---> GioFileClass.FFI.fromPtr true) getLocation_ self
    fun getNthBookmark self n = (GtkPlacesSidebarClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GioFileClass.FFI.fromPtr true) getNthBookmark_ (self & n)
    fun getOpenFlags self = (GtkPlacesSidebarClass.FFI.withPtr ---> GtkPlacesOpenFlags.FFI.fromVal) getOpenFlags_ self
    fun getShowConnectToServer self = (GtkPlacesSidebarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowConnectToServer_ self
    fun getShowDesktop self = (GtkPlacesSidebarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowDesktop_ self
    fun getShowEnterLocation self = (GtkPlacesSidebarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowEnterLocation_ self
    fun getShowOtherLocations self = (GtkPlacesSidebarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowOtherLocations_ self
    fun getShowRecent self = (GtkPlacesSidebarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowRecent_ self
    fun getShowTrash self = (GtkPlacesSidebarClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowTrash_ self
    fun removeShortcut self location = (GtkPlacesSidebarClass.FFI.withPtr &&&> GioFileClass.FFI.withPtr ---> I) removeShortcut_ (self & location)
    fun setDropTargetsVisible self (visible, context) =
      (
        GtkPlacesSidebarClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GdkDragContextClass.FFI.withPtr
         ---> I
      )
        setDropTargetsVisible_
        (
          self
           & visible
           & context
        )
    fun setLocalOnly self localOnly = (GtkPlacesSidebarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setLocation self location = (GtkPlacesSidebarClass.FFI.withPtr &&&> GioFileClass.FFI.withOptPtr ---> I) setLocation_ (self & location)
    fun setOpenFlags self flags = (GtkPlacesSidebarClass.FFI.withPtr &&&> GtkPlacesOpenFlags.FFI.withVal ---> I) setOpenFlags_ (self & flags)
    fun setShowConnectToServer self showConnectToServer = (GtkPlacesSidebarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowConnectToServer_ (self & showConnectToServer)
    fun setShowDesktop self showDesktop = (GtkPlacesSidebarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowDesktop_ (self & showDesktop)
    fun setShowEnterLocation self showEnterLocation = (GtkPlacesSidebarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowEnterLocation_ (self & showEnterLocation)
    fun setShowOtherLocations self showOtherLocations = (GtkPlacesSidebarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowOtherLocations_ (self & showOtherLocations)
    fun setShowRecent self showRecent = (GtkPlacesSidebarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowRecent_ (self & showRecent)
    fun setShowTrash self showTrash = (GtkPlacesSidebarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowTrash_ (self & showTrash)
    local
      open ClosureMarshal Signal
    in
      fun dragActionAskSig f = signal "drag-action-ask" (get 0w1 int ---> ret int) f
      fun mountSig f = signal "mount" (get 0w1 GioMountOperationClass.t ---> ret_void) f
      fun openLocationSig f = signal "open-location" (get 0w1 GioFileClass.t &&&> get 0w2 GtkPlacesOpenFlags.t ---> ret_void) (fn location & openFlags => f (location, openFlags))
      fun populatePopupSig f =
        signal "populate-popup"
          (
            get 0w1 GtkWidgetClass.t
             &&&> get 0w2 GioFileClass.tOpt
             &&&> get 0w3 GioVolumeClass.tOpt
             ---> ret_void
          )
          (
            fn
              container
               & selectedItem
               & selectedVolume =>
                f
                  (
                    container,
                    selectedItem,
                    selectedVolume
                  )
          )
      fun showConnectToServerSig f = signal "show-connect-to-server" (void ---> ret_void) f
      fun showEnterLocationSig f = signal "show-enter-location" (void ---> ret_void) f
      fun showErrorMessageSig f = signal "show-error-message" (get 0w1 string &&&> get 0w2 string ---> ret_void) (fn primary & secondary => f (primary, secondary))
      fun showOtherLocationsSig f = signal "show-other-locations" (void ---> ret_void) f
      fun showOtherLocationsWithFlagsSig f = signal "show-other-locations-with-flags" (get 0w1 GtkPlacesOpenFlags.t ---> ret_void) f
      fun unmountSig f = signal "unmount" (get 0w1 GioMountOperationClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val localOnlyProp =
        {
          get = fn x => get "local-only" boolean x,
          set = fn x => set "local-only" boolean x
        }
      val locationProp =
        {
          get = fn x => get "location" GioFileClass.tOpt x,
          set = fn x => set "location" GioFileClass.tOpt x
        }
      val openFlagsProp =
        {
          get = fn x => get "open-flags" GtkPlacesOpenFlags.t x,
          set = fn x => set "open-flags" GtkPlacesOpenFlags.t x
        }
      val populateAllProp =
        {
          get = fn x => get "populate-all" boolean x,
          set = fn x => set "populate-all" boolean x
        }
      val showConnectToServerProp =
        {
          get = fn x => get "show-connect-to-server" boolean x,
          set = fn x => set "show-connect-to-server" boolean x
        }
      val showDesktopProp =
        {
          get = fn x => get "show-desktop" boolean x,
          set = fn x => set "show-desktop" boolean x
        }
      val showEnterLocationProp =
        {
          get = fn x => get "show-enter-location" boolean x,
          set = fn x => set "show-enter-location" boolean x
        }
      val showOtherLocationsProp =
        {
          get = fn x => get "show-other-locations" boolean x,
          set = fn x => set "show-other-locations" boolean x
        }
      val showRecentProp =
        {
          get = fn x => get "show-recent" boolean x,
          set = fn x => set "show-recent" boolean x
        }
      val showTrashProp =
        {
          get = fn x => get "show-trash" boolean x,
          set = fn x => set "show-trash" boolean x
        }
    end
  end
