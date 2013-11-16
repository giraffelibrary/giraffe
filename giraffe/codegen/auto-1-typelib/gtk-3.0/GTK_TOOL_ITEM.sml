signature GTK_TOOL_ITEM =
  sig
    type 'a class_t
    type 'a widgetclass_t
    type toolbarstyle_t
    type 'a sizegroupclass_t
    type orientation_t
    type reliefstyle_t
    type 'a buildableclass_t
    type 'a activatableclass_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asActivatable : 'a class_t -> base activatableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
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
       -> base widgetclass_t
    val getReliefStyle : 'a class_t -> reliefstyle_t
    val getTextAlignment : 'a class_t -> real
    val getTextOrientation : 'a class_t -> orientation_t
    val getTextSizeGroup : 'a class_t -> base sizegroupclass_t
    val getToolbarStyle : 'a class_t -> toolbarstyle_t
    val getUseDragWindow : 'a class_t -> bool
    val getVisibleHorizontal : 'a class_t -> bool
    val getVisibleVertical : 'a class_t -> bool
    val rebuildMenu : 'a class_t -> unit
    val retrieveProxyMenuItem : 'a class_t -> base widgetclass_t
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
       -> 'b widgetclass_t
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
