signature GTK_NOTEBOOK =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type packtype_t
    type notebooktab_t
    type directiontype_t
    type 'a widgetclass_t
    type positiontype_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val appendPage :
      'a class_t
       -> 'b widgetclass_t
       -> 'c widgetclass_t option
       -> LargeInt.int
    val appendPageMenu :
      'a class_t
       -> 'b widgetclass_t
       -> 'c widgetclass_t option
       -> 'd widgetclass_t option
       -> LargeInt.int
    val getActionWidget :
      'a class_t
       -> packtype_t
       -> base widgetclass_t
    val getCurrentPage : 'a class_t -> LargeInt.int
    val getGroupName : 'a class_t -> string
    val getMenuLabel :
      'a class_t
       -> 'b widgetclass_t
       -> base widgetclass_t
    val getMenuLabelText :
      'a class_t
       -> 'b widgetclass_t
       -> string
    val getNPages : 'a class_t -> LargeInt.int
    val getNthPage :
      'a class_t
       -> LargeInt.int
       -> base widgetclass_t
    val getScrollable : 'a class_t -> bool
    val getShowBorder : 'a class_t -> bool
    val getShowTabs : 'a class_t -> bool
    val getTabDetachable :
      'a class_t
       -> 'b widgetclass_t
       -> bool
    val getTabHborder : 'a class_t -> LargeInt.int
    val getTabLabel :
      'a class_t
       -> 'b widgetclass_t
       -> base widgetclass_t
    val getTabLabelText :
      'a class_t
       -> 'b widgetclass_t
       -> string
    val getTabPos : 'a class_t -> positiontype_t
    val getTabReorderable :
      'a class_t
       -> 'b widgetclass_t
       -> bool
    val getTabVborder : 'a class_t -> LargeInt.int
    val insertPage :
      'a class_t
       -> 'b widgetclass_t
       -> 'c widgetclass_t option
       -> LargeInt.int
       -> LargeInt.int
    val insertPageMenu :
      'a class_t
       -> 'b widgetclass_t
       -> 'c widgetclass_t option
       -> 'd widgetclass_t option
       -> LargeInt.int
       -> LargeInt.int
    val nextPage : 'a class_t -> unit
    val pageNum :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
    val popupDisable : 'a class_t -> unit
    val popupEnable : 'a class_t -> unit
    val prependPage :
      'a class_t
       -> 'b widgetclass_t
       -> 'c widgetclass_t option
       -> LargeInt.int
    val prependPageMenu :
      'a class_t
       -> 'b widgetclass_t
       -> 'c widgetclass_t option
       -> 'd widgetclass_t option
       -> LargeInt.int
    val prevPage : 'a class_t -> unit
    val removePage :
      'a class_t
       -> LargeInt.int
       -> unit
    val reorderChild :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> unit
    val setActionWidget :
      'a class_t
       -> 'b widgetclass_t
       -> packtype_t
       -> unit
    val setCurrentPage :
      'a class_t
       -> LargeInt.int
       -> unit
    val setGroupName :
      'a class_t
       -> string option
       -> unit
    val setMenuLabel :
      'a class_t
       -> 'b widgetclass_t
       -> 'c widgetclass_t option
       -> unit
    val setMenuLabelText :
      'a class_t
       -> 'b widgetclass_t
       -> string
       -> unit
    val setScrollable :
      'a class_t
       -> bool
       -> unit
    val setShowBorder :
      'a class_t
       -> bool
       -> unit
    val setShowTabs :
      'a class_t
       -> bool
       -> unit
    val setTabDetachable :
      'a class_t
       -> 'b widgetclass_t
       -> bool
       -> unit
    val setTabLabel :
      'a class_t
       -> 'b widgetclass_t
       -> 'c widgetclass_t option
       -> unit
    val setTabLabelText :
      'a class_t
       -> 'b widgetclass_t
       -> string
       -> unit
    val setTabPos :
      'a class_t
       -> positiontype_t
       -> unit
    val setTabReorderable :
      'a class_t
       -> 'b widgetclass_t
       -> bool
       -> unit
    val changeCurrentPageSig : (LargeInt.int -> bool) -> 'a class_t Signal.signal
    val createWindowSig :
      (base widgetclass_t
        -> LargeInt.int
        -> LargeInt.int
        -> 'a class_t)
       -> 'b class_t Signal.signal
    val focusTabSig : (notebooktab_t -> bool) -> 'a class_t Signal.signal
    val moveFocusOutSig : (directiontype_t -> unit) -> 'a class_t Signal.signal
    val pageAddedSig :
      (base widgetclass_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val pageRemovedSig :
      (base widgetclass_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val pageReorderedSig :
      (base widgetclass_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val reorderTabSig :
      (directiontype_t
        -> bool
        -> bool)
       -> 'a class_t Signal.signal
    val selectPageSig : (bool -> bool) -> 'a class_t Signal.signal
    val switchPageSig :
      (base widgetclass_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val enablePopupProp : ('a class_t, bool, bool) Property.readwrite
    val groupNameProp : ('a class_t, string option, string option) Property.readwrite
    val pageProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val scrollableProp : ('a class_t, bool, bool) Property.readwrite
    val showBorderProp : ('a class_t, bool, bool) Property.readwrite
    val showTabsProp : ('a class_t, bool, bool) Property.readwrite
    val tabPosProp : ('a class_t, positiontype_t, positiontype_t) Property.readwrite
  end
