signature GTK_TOOL_ITEM =
  sig
    type 'a class_t
    type 'a activatable_class_t
    type 'a buildable_class_t
    type relief_style_t
    type orientation_t
    type 'a size_group_class_t
    type toolbar_style_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatable_class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getEllipsizeMode : 'a class_t -> Pango.EllipsizeMode.t
    val getExpand : 'a class_t -> bool
    val getHomogeneous : 'a class_t -> bool
    val getIconSize : 'a class_t -> LargeInt.int
    val getIsImportant : 'a class_t -> bool
    val getOrientation : 'a class_t -> orientation_t
    val getProxyMenuItem :
      'a class_t
       -> string
       -> base widget_class_t
    val getReliefStyle : 'a class_t -> relief_style_t
    val getTextAlignment : 'a class_t -> real
    val getTextOrientation : 'a class_t -> orientation_t
    val getTextSizeGroup : 'a class_t -> base size_group_class_t
    val getToolbarStyle : 'a class_t -> toolbar_style_t
    val getUseDragWindow : 'a class_t -> bool
    val getVisibleHorizontal : 'a class_t -> bool
    val getVisibleVertical : 'a class_t -> bool
    val rebuildMenu : 'a class_t -> unit
    val retrieveProxyMenuItem : 'a class_t -> base widget_class_t
    val setExpand :
      'a class_t
       -> bool
       -> unit
    val setHomogeneous :
      'a class_t
       -> bool
       -> unit
    val setIsImportant :
      'a class_t
       -> bool
       -> unit
    val setProxyMenuItem :
      'a class_t
       -> string
       -> 'b widget_class_t
       -> unit
    val setTooltipMarkup :
      'a class_t
       -> string
       -> unit
    val setTooltipText :
      'a class_t
       -> string
       -> unit
    val setUseDragWindow :
      'a class_t
       -> bool
       -> unit
    val setVisibleHorizontal :
      'a class_t
       -> bool
       -> unit
    val setVisibleVertical :
      'a class_t
       -> bool
       -> unit
    val toolbarReconfigured : 'a class_t -> unit
    val createMenuProxySig : (unit -> bool) -> 'a class_t Signal.signal
    val toolbarReconfiguredSig : (unit -> unit) -> 'a class_t Signal.signal
    val isImportantProp : ('a class_t, bool, bool) Property.readwrite
    val visibleHorizontalProp : ('a class_t, bool, bool) Property.readwrite
    val visibleVerticalProp : ('a class_t, bool, bool) Property.readwrite
  end
