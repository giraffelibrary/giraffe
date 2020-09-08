signature GTK_TOOL_ITEM =
  sig
    type 'a class
    type 'a activatable_class
    type 'a buildable_class
    type relief_style_t
    type orientation_t
    type 'a size_group_class
    type toolbar_style_t
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asActivatable : 'a class -> base activatable_class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getEllipsizeMode : 'a class -> Pango.EllipsizeMode.t
    val getExpand : 'a class -> bool
    val getHomogeneous : 'a class -> bool
    val getIconSize : 'a class -> LargeInt.int
    val getIsImportant : 'a class -> bool
    val getOrientation : 'a class -> orientation_t
    val getProxyMenuItem :
      'a class
       -> string
       -> base widget_class
    val getReliefStyle : 'a class -> relief_style_t
    val getTextAlignment : 'a class -> real
    val getTextOrientation : 'a class -> orientation_t
    val getTextSizeGroup : 'a class -> base size_group_class
    val getToolbarStyle : 'a class -> toolbar_style_t
    val getUseDragWindow : 'a class -> bool
    val getVisibleHorizontal : 'a class -> bool
    val getVisibleVertical : 'a class -> bool
    val rebuildMenu : 'a class -> unit
    val retrieveProxyMenuItem : 'a class -> base widget_class
    val setExpand :
      'a class
       -> bool
       -> unit
    val setHomogeneous :
      'a class
       -> bool
       -> unit
    val setIsImportant :
      'a class
       -> bool
       -> unit
    val setProxyMenuItem :
      'a class
       -> string * 'b widget_class
       -> unit
    val setTooltipMarkup :
      'a class
       -> string
       -> unit
    val setTooltipText :
      'a class
       -> string
       -> unit
    val setUseDragWindow :
      'a class
       -> bool
       -> unit
    val setVisibleHorizontal :
      'a class
       -> bool
       -> unit
    val setVisibleVertical :
      'a class
       -> bool
       -> unit
    val toolbarReconfigured : 'a class -> unit
    val createMenuProxySig : (unit -> bool) -> 'a class Signal.t
    val toolbarReconfiguredSig : (unit -> unit) -> 'a class Signal.t
    val isImportantProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val visibleHorizontalProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val visibleVerticalProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
