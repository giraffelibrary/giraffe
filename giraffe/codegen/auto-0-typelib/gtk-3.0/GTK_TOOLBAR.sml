signature GTK_TOOLBAR =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type 'a tool_shell_class_t
    type relief_style_t
    type 'a tool_item_class_t
    type orientation_t
    type toolbar_style_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val asToolShell : 'a class_t -> base tool_shell_class_t
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
       -> 'b tool_item_class_t
       -> LargeInt.int
    val getNItems : 'a class_t -> LargeInt.int
    val getNthItem :
      'a class_t
       -> LargeInt.int
       -> base tool_item_class_t
    val getReliefStyle : 'a class_t -> relief_style_t
    val getShowArrow : 'a class_t -> bool
    val getStyle : 'a class_t -> toolbar_style_t
    val insert :
      'a class_t
       -> 'b tool_item_class_t
       -> LargeInt.int
       -> unit
    val setDropHighlightItem :
      'a class_t
       -> 'b tool_item_class_t option
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
       -> toolbar_style_t
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
    val styleChangedSig : (toolbar_style_t -> unit) -> 'a class_t Signal.signal
    val iconSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val iconSizeSetProp : ('a class_t, bool, bool) Property.readwrite
    val showArrowProp : ('a class_t, bool, bool) Property.readwrite
    val toolbarStyleProp : ('a class_t, toolbar_style_t, toolbar_style_t) Property.readwrite
  end
