signature GTK_RECENT_CHOOSER =
  sig
    type 'a class
    type recent_info_t
    type 'a recent_filter_class
    type 'a recent_manager_class
    type recent_sort_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val addFilter :
      'a class
       -> 'b recent_filter_class
       -> unit
    val getCurrentItem : 'a class -> recent_info_t
    val getCurrentUri : 'a class -> string
    val getFilter : 'a class -> base recent_filter_class
    val getLimit : 'a class -> LargeInt.int
    val getLocalOnly : 'a class -> bool
    val getSelectMultiple : 'a class -> bool
    val getShowIcons : 'a class -> bool
    val getShowNotFound : 'a class -> bool
    val getShowPrivate : 'a class -> bool
    val getShowTips : 'a class -> bool
    val getSortType : 'a class -> recent_sort_type_t
    val removeFilter :
      'a class
       -> 'b recent_filter_class
       -> unit
    val selectAll : 'a class -> unit
    val selectUri :
      'a class
       -> string
       -> bool
    val setCurrentUri :
      'a class
       -> string
       -> bool
    val setFilter :
      'a class
       -> 'b recent_filter_class
       -> unit
    val setLimit :
      'a class
       -> LargeInt.int
       -> unit
    val setLocalOnly :
      'a class
       -> bool
       -> unit
    val setSelectMultiple :
      'a class
       -> bool
       -> unit
    val setShowIcons :
      'a class
       -> bool
       -> unit
    val setShowNotFound :
      'a class
       -> bool
       -> unit
    val setShowPrivate :
      'a class
       -> bool
       -> unit
    val setShowTips :
      'a class
       -> bool
       -> unit
    val setSortType :
      'a class
       -> recent_sort_type_t
       -> unit
    val unselectAll : 'a class -> unit
    val unselectUri :
      'a class
       -> string
       -> unit
    val itemActivatedSig : (unit -> unit) -> 'a class Signal.signal
    val selectionChangedSig : (unit -> unit) -> 'a class Signal.signal
    val filterProp : ('a class, base recent_filter_class option, 'b recent_filter_class option) Property.readwrite
    val limitProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val localOnlyProp : ('a class, bool, bool) Property.readwrite
    val recentManagerProp : ('a class, 'b recent_manager_class option) Property.writeonly
    val selectMultipleProp : ('a class, bool, bool) Property.readwrite
    val showIconsProp : ('a class, bool, bool) Property.readwrite
    val showNotFoundProp : ('a class, bool, bool) Property.readwrite
    val showPrivateProp : ('a class, bool, bool) Property.readwrite
    val showTipsProp : ('a class, bool, bool) Property.readwrite
    val sortTypeProp : ('a class, recent_sort_type_t, recent_sort_type_t) Property.readwrite
  end
