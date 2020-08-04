structure GtkPlacesSidebar :>
  GTK_PLACES_SIDEBAR
    where type 'a class = 'a GtkPlacesSidebarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type places_open_flags_t = GtkPlacesOpenFlags.t =
  struct
    val getType_ = _import "gtk_places_sidebar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_places_sidebar_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val addShortcut_ = fn x1 & x2 => (_import "gtk_places_sidebar_add_shortcut" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GioFileClass.FFI.non_opt GioFileClass.FFI.p -> unit;) (x1, x2)
    val getLocalOnly_ = _import "gtk_places_sidebar_get_local_only" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p -> GBool.FFI.val_;
    val getLocation_ = _import "gtk_places_sidebar_get_location" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p -> GioFileClass.FFI.opt GioFileClass.FFI.p;
    val getNthBookmark_ = fn x1 & x2 => (_import "gtk_places_sidebar_get_nth_bookmark" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GInt.FFI.val_ -> GioFileClass.FFI.opt GioFileClass.FFI.p;) (x1, x2)
    val getOpenFlags_ = _import "gtk_places_sidebar_get_open_flags" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p -> GtkPlacesOpenFlags.FFI.val_;
    val getShowConnectToServer_ = _import "gtk_places_sidebar_get_show_connect_to_server" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p -> GBool.FFI.val_;
    val getShowDesktop_ = _import "gtk_places_sidebar_get_show_desktop" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p -> GBool.FFI.val_;
    val getShowEnterLocation_ = _import "gtk_places_sidebar_get_show_enter_location" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p -> GBool.FFI.val_;
    val getShowOtherLocations_ = _import "gtk_places_sidebar_get_show_other_locations" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p -> GBool.FFI.val_;
    val getShowRecent_ = _import "gtk_places_sidebar_get_show_recent" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p -> GBool.FFI.val_;
    val getShowTrash_ = _import "gtk_places_sidebar_get_show_trash" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p -> GBool.FFI.val_;
    val removeShortcut_ = fn x1 & x2 => (_import "gtk_places_sidebar_remove_shortcut" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GioFileClass.FFI.non_opt GioFileClass.FFI.p -> unit;) (x1, x2)
    val setDropTargetsVisible_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_places_sidebar_set_drop_targets_visible" :
              GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p
               * GBool.FFI.val_
               * GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLocalOnly_ = fn x1 & x2 => (_import "gtk_places_sidebar_set_local_only" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLocation_ = fn x1 & x2 => (_import "gtk_places_sidebar_set_location" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GioFileClass.FFI.opt GioFileClass.FFI.p -> unit;) (x1, x2)
    val setOpenFlags_ = fn x1 & x2 => (_import "gtk_places_sidebar_set_open_flags" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GtkPlacesOpenFlags.FFI.val_ -> unit;) (x1, x2)
    val setShowConnectToServer_ = fn x1 & x2 => (_import "gtk_places_sidebar_set_show_connect_to_server" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowDesktop_ = fn x1 & x2 => (_import "gtk_places_sidebar_set_show_desktop" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowEnterLocation_ = fn x1 & x2 => (_import "gtk_places_sidebar_set_show_enter_location" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowOtherLocations_ = fn x1 & x2 => (_import "gtk_places_sidebar_set_show_other_locations" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowRecent_ = fn x1 & x2 => (_import "gtk_places_sidebar_set_show_recent" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShowTrash_ = fn x1 & x2 => (_import "gtk_places_sidebar_set_show_trash" : GtkPlacesSidebarClass.FFI.non_opt GtkPlacesSidebarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkPlacesSidebarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type places_open_flags_t = GtkPlacesOpenFlags.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkPlacesSidebarClass.FFI.fromPtr false) new_ ()
    fun addShortcut self location = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GioFileClass.FFI.withPtr false ---> I) addShortcut_ (self & location)
    fun getLocalOnly self = (GtkPlacesSidebarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLocalOnly_ self
    fun getLocation self = (GtkPlacesSidebarClass.FFI.withPtr false ---> GioFileClass.FFI.fromOptPtr true) getLocation_ self
    fun getNthBookmark self n = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GioFileClass.FFI.fromOptPtr true) getNthBookmark_ (self & n)
    fun getOpenFlags self = (GtkPlacesSidebarClass.FFI.withPtr false ---> GtkPlacesOpenFlags.FFI.fromVal) getOpenFlags_ self
    fun getShowConnectToServer self = (GtkPlacesSidebarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowConnectToServer_ self
    fun getShowDesktop self = (GtkPlacesSidebarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowDesktop_ self
    fun getShowEnterLocation self = (GtkPlacesSidebarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowEnterLocation_ self
    fun getShowOtherLocations self = (GtkPlacesSidebarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowOtherLocations_ self
    fun getShowRecent self = (GtkPlacesSidebarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowRecent_ self
    fun getShowTrash self = (GtkPlacesSidebarClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowTrash_ self
    fun removeShortcut self location = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GioFileClass.FFI.withPtr false ---> I) removeShortcut_ (self & location)
    fun setDropTargetsVisible self (visible, context) =
      (
        GtkPlacesSidebarClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GdkDragContextClass.FFI.withPtr false
         ---> I
      )
        setDropTargetsVisible_
        (
          self
           & visible
           & context
        )
    fun setLocalOnly self localOnly = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setLocalOnly_ (self & localOnly)
    fun setLocation self location = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GioFileClass.FFI.withOptPtr false ---> I) setLocation_ (self & location)
    fun setOpenFlags self flags = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GtkPlacesOpenFlags.FFI.withVal ---> I) setOpenFlags_ (self & flags)
    fun setShowConnectToServer self showConnectToServer = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowConnectToServer_ (self & showConnectToServer)
    fun setShowDesktop self showDesktop = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowDesktop_ (self & showDesktop)
    fun setShowEnterLocation self showEnterLocation = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowEnterLocation_ (self & showEnterLocation)
    fun setShowOtherLocations self showOtherLocations = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowOtherLocations_ (self & showOtherLocations)
    fun setShowRecent self showRecent = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowRecent_ (self & showRecent)
    fun setShowTrash self showTrash = (GtkPlacesSidebarClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowTrash_ (self & showTrash)
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
          set = fn x => set "local-only" boolean x,
          new = fn x => new "local-only" boolean x
        }
      val locationProp =
        {
          get = fn x => get "location" GioFileClass.tOpt x,
          set = fn x => set "location" GioFileClass.tOpt x,
          new = fn x => new "location" GioFileClass.tOpt x
        }
      val openFlagsProp =
        {
          get = fn x => get "open-flags" GtkPlacesOpenFlags.t x,
          set = fn x => set "open-flags" GtkPlacesOpenFlags.t x,
          new = fn x => new "open-flags" GtkPlacesOpenFlags.t x
        }
      val populateAllProp =
        {
          get = fn x => get "populate-all" boolean x,
          set = fn x => set "populate-all" boolean x,
          new = fn x => new "populate-all" boolean x
        }
      val showConnectToServerProp =
        {
          get = fn x => get "show-connect-to-server" boolean x,
          set = fn x => set "show-connect-to-server" boolean x,
          new = fn x => new "show-connect-to-server" boolean x
        }
      val showDesktopProp =
        {
          get = fn x => get "show-desktop" boolean x,
          set = fn x => set "show-desktop" boolean x,
          new = fn x => new "show-desktop" boolean x
        }
      val showEnterLocationProp =
        {
          get = fn x => get "show-enter-location" boolean x,
          set = fn x => set "show-enter-location" boolean x,
          new = fn x => new "show-enter-location" boolean x
        }
      val showOtherLocationsProp =
        {
          get = fn x => get "show-other-locations" boolean x,
          set = fn x => set "show-other-locations" boolean x,
          new = fn x => new "show-other-locations" boolean x
        }
      val showRecentProp =
        {
          get = fn x => get "show-recent" boolean x,
          set = fn x => set "show-recent" boolean x,
          new = fn x => new "show-recent" boolean x
        }
      val showTrashProp =
        {
          get = fn x => get "show-trash" boolean x,
          set = fn x => set "show-trash" boolean x,
          new = fn x => new "show-trash" boolean x
        }
    end
  end
