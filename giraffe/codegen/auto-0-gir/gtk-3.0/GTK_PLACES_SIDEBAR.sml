signature GTK_PLACES_SIDEBAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a widget_class
    type places_open_flags_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addShortcut :
      'a class
       -> 'b Gio.FileClass.class
       -> unit
    val getLocalOnly : 'a class -> bool
    val getLocation : 'a class -> base Gio.FileClass.class
    val getNthBookmark :
      'a class
       -> LargeInt.int
       -> base Gio.FileClass.class
    val getOpenFlags : 'a class -> places_open_flags_t
    val getShowConnectToServer : 'a class -> bool
    val getShowDesktop : 'a class -> bool
    val getShowEnterLocation : 'a class -> bool
    val getShowOtherLocations : 'a class -> bool
    val getShowRecent : 'a class -> bool
    val getShowTrash : 'a class -> bool
    val removeShortcut :
      'a class
       -> 'b Gio.FileClass.class
       -> unit
    val setDropTargetsVisible :
      'a class
       -> bool * 'b Gdk.DragContextClass.class
       -> unit
    val setLocalOnly :
      'a class
       -> bool
       -> unit
    val setLocation :
      'a class
       -> 'b Gio.FileClass.class option
       -> unit
    val setOpenFlags :
      'a class
       -> places_open_flags_t
       -> unit
    val setShowConnectToServer :
      'a class
       -> bool
       -> unit
    val setShowDesktop :
      'a class
       -> bool
       -> unit
    val setShowEnterLocation :
      'a class
       -> bool
       -> unit
    val setShowOtherLocations :
      'a class
       -> bool
       -> unit
    val setShowRecent :
      'a class
       -> bool
       -> unit
    val setShowTrash :
      'a class
       -> bool
       -> unit
    val dragActionAskSig : (LargeInt.int -> LargeInt.int) -> 'a class Signal.t
    val mountSig : (base Gio.MountOperationClass.class -> unit) -> 'a class Signal.t
    val openLocationSig : (base Gio.FileClass.class * places_open_flags_t -> unit) -> 'a class Signal.t
    val populatePopupSig :
      (base widget_class
        * base Gio.FileClass.class option
        * base Gio.VolumeClass.class option
        -> unit)
       -> 'a class Signal.t
    val showConnectToServerSig : (unit -> unit) -> 'a class Signal.t
    val showEnterLocationSig : (unit -> unit) -> 'a class Signal.t
    val showErrorMessageSig : (string * string -> unit) -> 'a class Signal.t
    val showOtherLocationsSig : (unit -> unit) -> 'a class Signal.t
    val showOtherLocationsWithFlagsSig : (places_open_flags_t -> unit) -> 'a class Signal.t
    val unmountSig : (base Gio.MountOperationClass.class -> unit) -> 'a class Signal.t
    val localOnlyProp : ('a class, bool, bool) Property.readwrite
    val locationProp : ('a class, base Gio.FileClass.class option, 'b Gio.FileClass.class option) Property.readwrite
    val openFlagsProp : ('a class, places_open_flags_t, places_open_flags_t) Property.readwrite
    val populateAllProp : ('a class, bool, bool) Property.readwrite
    val showConnectToServerProp : ('a class, bool, bool) Property.readwrite
    val showDesktopProp : ('a class, bool, bool) Property.readwrite
    val showEnterLocationProp : ('a class, bool, bool) Property.readwrite
    val showOtherLocationsProp : ('a class, bool, bool) Property.readwrite
    val showRecentProp : ('a class, bool, bool) Property.readwrite
    val showTrashProp : ('a class, bool, bool) Property.readwrite
  end
