signature GTK_TOOLBAR =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a orientableclass_t
    type 'a toolshellclass_t
    type reliefstyle_t
    type 'a toolitemclass_t
    type orientation_t
    type toolbarstyle_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val asToolShell : 'a class_t -> base toolshellclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getDropIndex :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val getIconSize : 'a class_t -> LargeInt.int
    val getItemIndex :
      'a class_t
       -> 'b toolitemclass_t
       -> LargeInt.int
    val getNItems : 'a class_t -> LargeInt.int
    val getNthItem :
      'a class_t
       -> LargeInt.int
       -> base toolitemclass_t
    val getReliefStyle : 'a class_t -> reliefstyle_t
    val getShowArrow : 'a class_t -> bool
    val getStyle : 'a class_t -> toolbarstyle_t
    val insert :
      'a class_t
       -> 'b toolitemclass_t
       -> LargeInt.int
       -> unit
    val setDropHighlightItem :
      'a class_t
       -> 'b toolitemclass_t option
       -> LargeInt.int
       -> unit
    val setIconSize :
      'a class_t
       -> LargeInt.int
       -> unit
    val setShowArrow :
      'a class_t
       -> bool
       -> unit
    val setStyle :
      'a class_t
       -> toolbarstyle_t
       -> unit
    val unsetIconSize : 'a class_t -> unit
    val unsetStyle : 'a class_t -> unit
    val focusHomeOrEndSig : (bool -> bool) -> 'a class_t Signal.signal
    val orientationChangedSig : (orientation_t -> unit) -> 'a class_t Signal.signal
    val popupContextMenuSig :
      (LargeInt.int
        -> LargeInt.int
        -> LargeInt.int
        -> bool)
       -> 'a class_t Signal.signal
    val styleChangedSig : (toolbarstyle_t -> unit) -> 'a class_t Signal.signal
    val iconSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val iconSizeSetProp : ('a class_t, bool, bool) Property.readwrite
    val showArrowProp : ('a class_t, bool, bool) Property.readwrite
    val toolbarStyleProp : ('a class_t, toolbarstyle_t, toolbarstyle_t) Property.readwrite
  end
