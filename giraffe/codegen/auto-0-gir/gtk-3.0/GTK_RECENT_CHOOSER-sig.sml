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
    val getUris : 'a class -> Utf8CPtrArray.t
    val removeFilter :
      'a class
       -> 'b recent_filter_class
       -> unit
    val selectAll : 'a class -> unit
    val selectUri :
      'a class
       -> string
       -> unit
    val setCurrentUri :
      'a class
       -> string
       -> unit
    val setFilter :
      'a class
       -> 'b recent_filter_class option
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
    val itemActivatedSig : (unit -> unit) -> 'a class Signal.t
    val selectionChangedSig : (unit -> unit) -> 'a class Signal.t
    val filterProp : ('a class, unit -> base recent_filter_class option, 'b recent_filter_class option -> unit, 'b recent_filter_class option -> unit) Property.t
    val limitProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val localOnlyProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val recentManagerProp : ('a class, unit, unit, 'b recent_manager_class option -> unit) Property.t
    val selectMultipleProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showIconsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showNotFoundProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showPrivateProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val showTipsProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val sortTypeProp : ('a class, unit -> recent_sort_type_t, recent_sort_type_t -> unit, recent_sort_type_t -> unit) Property.t
  end
