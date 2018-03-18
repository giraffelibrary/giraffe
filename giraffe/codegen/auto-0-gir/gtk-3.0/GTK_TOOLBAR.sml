signature GTK_TOOLBAR =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a tool_shell_class
    type relief_style_t
    type 'a tool_item_class
    type orientation_t
    type icon_size_t
    type toolbar_style_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val asToolShell : 'a class -> base tool_shell_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getDropIndex :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int
    val getIconSize : 'a class -> icon_size_t
    val getItemIndex :
      'a class
       -> 'b tool_item_class
       -> LargeInt.int
    val getNItems : 'a class -> LargeInt.int
    val getNthItem :
      'a class
       -> LargeInt.int
       -> base tool_item_class option
    val getReliefStyle : 'a class -> relief_style_t
    val getShowArrow : 'a class -> bool
    val getStyle : 'a class -> toolbar_style_t
    val insert :
      'a class
       -> 'b tool_item_class * LargeInt.int
       -> unit
    val setDropHighlightItem :
      'a class
       -> 'b tool_item_class option * LargeInt.int
       -> unit
    val setIconSize :
      'a class
       -> icon_size_t
       -> unit
    val setShowArrow :
      'a class
       -> bool
       -> unit
    val setStyle :
      'a class
       -> toolbar_style_t
       -> unit
    val unsetIconSize : 'a class -> unit
    val unsetStyle : 'a class -> unit
    val focusHomeOrEndSig : (bool -> bool) -> 'a class Signal.t
    val orientationChangedSig : (orientation_t -> unit) -> 'a class Signal.t
    val popupContextMenuSig :
      (LargeInt.int
        * LargeInt.int
        * LargeInt.int
        -> bool)
       -> 'a class Signal.t
    val styleChangedSig : (toolbar_style_t -> unit) -> 'a class Signal.t
    val iconSizeProp :
      {
        get : 'a class -> icon_size_t,
        set :
          icon_size_t
           -> 'a class
           -> unit,
        new : icon_size_t -> 'a class Property.t
      }
    val iconSizeSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showArrowProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val toolbarStyleProp :
      {
        get : 'a class -> toolbar_style_t,
        set :
          toolbar_style_t
           -> 'a class
           -> unit,
        new : toolbar_style_t -> 'a class Property.t
      }
  end
