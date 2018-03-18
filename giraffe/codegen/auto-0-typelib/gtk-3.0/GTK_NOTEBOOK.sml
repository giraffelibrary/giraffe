signature GTK_NOTEBOOK =
  sig
    type 'a class
    type 'a buildable_class
    type pack_type_t
    type notebook_tab_t
    type direction_type_t
    type 'a widget_class
    type position_type_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val appendPage :
      'a class
       -> 'b widget_class * 'c widget_class option
       -> LargeInt.int
    val appendPageMenu :
      'a class
       -> 'b widget_class
           * 'c widget_class option
           * 'd widget_class option
       -> LargeInt.int
    val detachTab :
      'a class
       -> 'b widget_class
       -> unit
    val getActionWidget :
      'a class
       -> pack_type_t
       -> base widget_class option
    val getCurrentPage : 'a class -> LargeInt.int
    val getGroupName : 'a class -> string option
    val getMenuLabel :
      'a class
       -> 'b widget_class
       -> base widget_class option
    val getMenuLabelText :
      'a class
       -> 'b widget_class
       -> string option
    val getNPages : 'a class -> LargeInt.int
    val getNthPage :
      'a class
       -> LargeInt.int
       -> base widget_class option
    val getScrollable : 'a class -> bool
    val getShowBorder : 'a class -> bool
    val getShowTabs : 'a class -> bool
    val getTabDetachable :
      'a class
       -> 'b widget_class
       -> bool
    val getTabHborder : 'a class -> LargeInt.int
    val getTabLabel :
      'a class
       -> 'b widget_class
       -> base widget_class option
    val getTabLabelText :
      'a class
       -> 'b widget_class
       -> string option
    val getTabPos : 'a class -> position_type_t
    val getTabReorderable :
      'a class
       -> 'b widget_class
       -> bool
    val getTabVborder : 'a class -> LargeInt.int
    val insertPage :
      'a class
       -> 'b widget_class
           * 'c widget_class option
           * LargeInt.int
       -> LargeInt.int
    val insertPageMenu :
      'a class
       -> 'b widget_class
           * 'c widget_class option
           * 'd widget_class option
           * LargeInt.int
       -> LargeInt.int
    val nextPage : 'a class -> unit
    val pageNum :
      'a class
       -> 'b widget_class
       -> LargeInt.int
    val popupDisable : 'a class -> unit
    val popupEnable : 'a class -> unit
    val prependPage :
      'a class
       -> 'b widget_class * 'c widget_class option
       -> LargeInt.int
    val prependPageMenu :
      'a class
       -> 'b widget_class
           * 'c widget_class option
           * 'd widget_class option
       -> LargeInt.int
    val prevPage : 'a class -> unit
    val removePage :
      'a class
       -> LargeInt.int
       -> unit
    val reorderChild :
      'a class
       -> 'b widget_class * LargeInt.int
       -> unit
    val setActionWidget :
      'a class
       -> 'b widget_class * pack_type_t
       -> unit
    val setCurrentPage :
      'a class
       -> LargeInt.int
       -> unit
    val setGroupName :
      'a class
       -> string option
       -> unit
    val setMenuLabel :
      'a class
       -> 'b widget_class * 'c widget_class option
       -> unit
    val setMenuLabelText :
      'a class
       -> 'b widget_class * string
       -> unit
    val setScrollable :
      'a class
       -> bool
       -> unit
    val setShowBorder :
      'a class
       -> bool
       -> unit
    val setShowTabs :
      'a class
       -> bool
       -> unit
    val setTabDetachable :
      'a class
       -> 'b widget_class * bool
       -> unit
    val setTabLabel :
      'a class
       -> 'b widget_class * 'c widget_class option
       -> unit
    val setTabLabelText :
      'a class
       -> 'b widget_class * string
       -> unit
    val setTabPos :
      'a class
       -> position_type_t
       -> unit
    val setTabReorderable :
      'a class
       -> 'b widget_class * bool
       -> unit
    val changeCurrentPageSig : (LargeInt.int -> bool) -> 'a class Signal.t
    val createWindowSig :
      (base widget_class
        * LargeInt.int
        * LargeInt.int
        -> 'a class)
       -> 'b class Signal.t
    val focusTabSig : (notebook_tab_t -> bool) -> 'a class Signal.t
    val moveFocusOutSig : (direction_type_t -> unit) -> 'a class Signal.t
    val pageAddedSig : (base widget_class * LargeInt.int -> unit) -> 'a class Signal.t
    val pageRemovedSig : (base widget_class * LargeInt.int -> unit) -> 'a class Signal.t
    val pageReorderedSig : (base widget_class * LargeInt.int -> unit) -> 'a class Signal.t
    val reorderTabSig : (direction_type_t * bool -> bool) -> 'a class Signal.t
    val selectPageSig : (bool -> bool) -> 'a class Signal.t
    val switchPageSig : (base widget_class * LargeInt.int -> unit) -> 'a class Signal.t
    val enablePopupProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val groupNameProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val pageProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val scrollableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showBorderProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showTabsProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val tabPosProp :
      {
        get : 'a class -> position_type_t,
        set :
          position_type_t
           -> 'a class
           -> unit,
        new : position_type_t -> 'a class Property.t
      }
  end
