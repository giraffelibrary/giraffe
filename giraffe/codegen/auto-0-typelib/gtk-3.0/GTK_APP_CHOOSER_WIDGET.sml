signature GTK_APP_CHOOSER_WIDGET =
  sig
    type 'a class_t
    type 'a appchooserclass_t
    type 'a buildableclass_t
    type 'a orientableclass_t
    type 'a menuclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asAppChooser : 'a class_t -> base appchooserclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val getDefaultText : 'a class_t -> string
    val getShowAll : 'a class_t -> bool
    val getShowDefault : 'a class_t -> bool
    val getShowFallback : 'a class_t -> bool
    val getShowOther : 'a class_t -> bool
    val getShowRecommended : 'a class_t -> bool
    val setDefaultText :
      'a class_t
       -> string
       -> unit
    val setShowAll :
      'a class_t
       -> bool
       -> unit
    val setShowDefault :
      'a class_t
       -> bool
       -> unit
    val setShowFallback :
      'a class_t
       -> bool
       -> unit
    val setShowOther :
      'a class_t
       -> bool
       -> unit
    val setShowRecommended :
      'a class_t
       -> bool
       -> unit
    val applicationActivatedSig : (base Gio.AppInfoClass.t -> unit) -> 'a class_t Signal.signal
    val applicationSelectedSig : (base Gio.AppInfoClass.t -> unit) -> 'a class_t Signal.signal
    val populatePopupSig :
      (base menuclass_t
        -> base Gio.AppInfoClass.t
        -> unit)
       -> 'a class_t Signal.signal
    val defaultTextProp : ('a class_t, string option, string option) Property.readwrite
    val showAllProp : ('a class_t, bool, bool) Property.readwrite
    val showDefaultProp : ('a class_t, bool, bool) Property.readwrite
    val showFallbackProp : ('a class_t, bool, bool) Property.readwrite
    val showOtherProp : ('a class_t, bool, bool) Property.readwrite
    val showRecommendedProp : ('a class_t, bool, bool) Property.readwrite
  end
