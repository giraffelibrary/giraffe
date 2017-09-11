signature GTK_APP_CHOOSER_WIDGET =
  sig
    type 'a class
    type 'a app_chooser_class
    type 'a buildable_class
    type 'a orientable_class
    type 'a menu_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asAppChooser : 'a class -> base app_chooser_class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val getDefaultText : 'a class -> string
    val getShowAll : 'a class -> bool
    val getShowDefault : 'a class -> bool
    val getShowFallback : 'a class -> bool
    val getShowOther : 'a class -> bool
    val getShowRecommended : 'a class -> bool
    val setDefaultText :
      'a class
       -> string
       -> unit
    val setShowAll :
      'a class
       -> bool
       -> unit
    val setShowDefault :
      'a class
       -> bool
       -> unit
    val setShowFallback :
      'a class
       -> bool
       -> unit
    val setShowOther :
      'a class
       -> bool
       -> unit
    val setShowRecommended :
      'a class
       -> bool
       -> unit
    val applicationActivatedSig : (base Gio.AppInfoClass.class -> unit) -> 'a class Signal.t
    val applicationSelectedSig : (base Gio.AppInfoClass.class -> unit) -> 'a class Signal.t
    val populatePopupSig : (base menu_class * base Gio.AppInfoClass.class -> unit) -> 'a class Signal.t
    val defaultTextProp : ('a class, string option, string option) Property.readwrite
    val showAllProp : ('a class, bool, bool) Property.readwrite
    val showDefaultProp : ('a class, bool, bool) Property.readwrite
    val showFallbackProp : ('a class, bool, bool) Property.readwrite
    val showOtherProp : ('a class, bool, bool) Property.readwrite
    val showRecommendedProp : ('a class, bool, bool) Property.readwrite
  end
