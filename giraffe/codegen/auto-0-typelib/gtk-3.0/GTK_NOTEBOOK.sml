signature GTK_NOTEBOOK =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type pack_type_t
    type notebook_tab_t
    type direction_type_t
    type 'a widget_class_t
    type position_type_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val appendPage :
      'a class_t
       -> 'b widget_class_t
       -> 'c widget_class_t option
       -> LargeInt.int
    val appendPageMenu :
      'a class_t
       -> 'b widget_class_t
       -> 'c widget_class_t option
       -> 'd widget_class_t option
       -> LargeInt.int
    val getActionWidget :
      'a class_t
       -> pack_type_t
       -> base widget_class_t
    val getCurrentPage : 'a class_t -> LargeInt.int
    val getGroupName : 'a class_t -> string
    val getMenuLabel :
      'a class_t
       -> 'b widget_class_t
       -> base widget_class_t
    val getMenuLabelText :
      'a class_t
       -> 'b widget_class_t
       -> string
    val getNPages : 'a class_t -> LargeInt.int
    val getNthPage :
      'a class_t
       -> LargeInt.int
       -> base widget_class_t
    val getScrollable : 'a class_t -> bool
    val getShowBorder : 'a class_t -> bool
    val getShowTabs : 'a class_t -> bool
    val getTabDetachable :
      'a class_t
       -> 'b widget_class_t
       -> bool
    val getTabHborder : 'a class_t -> LargeInt.int
    val getTabLabel :
      'a class_t
       -> 'b widget_class_t
       -> base widget_class_t
    val getTabLabelText :
      'a class_t
       -> 'b widget_class_t
       -> string
    val getTabPos : 'a class_t -> position_type_t
    val getTabReorderable :
      'a class_t
       -> 'b widget_class_t
       -> bool
    val getTabVborder : 'a class_t -> LargeInt.int
    val insertPage :
      'a class_t
       -> 'b widget_class_t
       -> 'c widget_class_t option
       -> LargeInt.int
       -> LargeInt.int
    val insertPageMenu :
      'a class_t
       -> 'b widget_class_t
       -> 'c widget_class_t option
       -> 'd widget_class_t option
       -> LargeInt.int
       -> LargeInt.int
    val nextPage : 'a class_t -> unit
    val pageNum :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
    val popupDisable : 'a class_t -> unit
    val popupEnable : 'a class_t -> unit
    val prependPage :
      'a class_t
       -> 'b widget_class_t
       -> 'c widget_class_t option
       -> LargeInt.int
    val prependPageMenu :
      'a class_t
       -> 'b widget_class_t
       -> 'c widget_class_t option
       -> 'd widget_class_t option
       -> LargeInt.int
    val prevPage : 'a class_t -> unit
    val removePage :
      'a class_t
       -> LargeInt.int
       -> unit
    val reorderChild :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> unit
    val setActionWidget :
      'a class_t
       -> 'b widget_class_t
       -> pack_type_t
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
       -> 'b widget_class_t
       -> 'c widget_class_t option
       -> unit
    val setMenuLabelText :
      'a class_t
       -> 'b widget_class_t
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
       -> 'b widget_class_t
       -> bool
       -> unit
    val setTabLabel :
      'a class_t
       -> 'b widget_class_t
       -> 'c widget_class_t option
       -> unit
    val setTabLabelText :
      'a class_t
       -> 'b widget_class_t
       -> string
       -> unit
    val setTabPos :
      'a class_t
       -> position_type_t
       -> unit
    val setTabReorderable :
      'a class_t
       -> 'b widget_class_t
       -> bool
       -> unit
    val changeCurrentPageSig : (LargeInt.int -> bool) -> 'a class_t Signal.signal
    val createWindowSig :
      (base widget_class_t
        -> LargeInt.int
        -> LargeInt.int
        -> 'a class_t)
       -> 'b class_t Signal.signal
    val focusTabSig : (notebook_tab_t -> bool) -> 'a class_t Signal.signal
    val moveFocusOutSig : (direction_type_t -> unit) -> 'a class_t Signal.signal
    val pageAddedSig :
      (base widget_class_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val pageRemovedSig :
      (base widget_class_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val pageReorderedSig :
      (base widget_class_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val reorderTabSig :
      (direction_type_t
        -> bool
        -> bool)
       -> 'a class_t Signal.signal
    val selectPageSig : (bool -> bool) -> 'a class_t Signal.signal
    val switchPageSig :
      (base widget_class_t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val enablePopupProp : ('a class_t, bool, bool) Property.readwrite
    val groupNameProp : ('a class_t, string option, string option) Property.readwrite
    val pageProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val scrollableProp : ('a class_t, bool, bool) Property.readwrite
    val showBorderProp : ('a class_t, bool, bool) Property.readwrite
    val showTabsProp : ('a class_t, bool, bool) Property.readwrite
    val tabPosProp : ('a class_t, position_type_t, position_type_t) Property.readwrite
  end
