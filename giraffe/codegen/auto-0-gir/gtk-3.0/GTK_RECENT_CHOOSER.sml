signature GTK_RECENT_CHOOSER =
  sig
    type 'a class_t
    type recent_info_record_t
    type 'a recent_filter_class_t
    type 'a recent_manager_class_t
    type recent_sort_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val addFilter :
      'a class_t
       -> 'b recent_filter_class_t
       -> unit
    val getCurrentItem : 'a class_t -> recent_info_record_t
    val getCurrentUri : 'a class_t -> string
    val getFilter : 'a class_t -> base recent_filter_class_t
    val getLimit : 'a class_t -> LargeInt.int
    val getLocalOnly : 'a class_t -> bool
    val getSelectMultiple : 'a class_t -> bool
    val getShowIcons : 'a class_t -> bool
    val getShowNotFound : 'a class_t -> bool
    val getShowPrivate : 'a class_t -> bool
    val getShowTips : 'a class_t -> bool
    val getSortType : 'a class_t -> recent_sort_type_t
    val removeFilter :
      'a class_t
       -> 'b recent_filter_class_t
       -> unit
    val selectAll : 'a class_t -> unit
    val selectUri :
      'a class_t
       -> string
       -> bool
    val setCurrentUri :
      'a class_t
       -> string
       -> bool
    val setFilter :
      'a class_t
       -> 'b recent_filter_class_t
       -> unit
    val setLimit :
      'a class_t
       -> LargeInt.int
       -> unit
    val setLocalOnly :
      'a class_t
       -> bool
       -> unit
    val setSelectMultiple :
      'a class_t
       -> bool
       -> unit
    val setShowIcons :
      'a class_t
       -> bool
       -> unit
    val setShowNotFound :
      'a class_t
       -> bool
       -> unit
    val setShowPrivate :
      'a class_t
       -> bool
       -> unit
    val setShowTips :
      'a class_t
       -> bool
       -> unit
    val setSortType :
      'a class_t
       -> recent_sort_type_t
       -> unit
    val unselectAll : 'a class_t -> unit
    val unselectUri :
      'a class_t
       -> string
       -> unit
    val itemActivatedSig : (unit -> unit) -> 'a class_t Signal.signal
    val selectionChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val filterProp : ('a class_t, base recent_filter_class_t option, 'b recent_filter_class_t option) Property.readwrite
    val limitProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val localOnlyProp : ('a class_t, bool, bool) Property.readwrite
    val recentManagerProp : ('a class_t, 'b recent_manager_class_t option) Property.writeonly
    val selectMultipleProp : ('a class_t, bool, bool) Property.readwrite
    val showIconsProp : ('a class_t, bool, bool) Property.readwrite
    val showNotFoundProp : ('a class_t, bool, bool) Property.readwrite
    val showPrivateProp : ('a class_t, bool, bool) Property.readwrite
    val showTipsProp : ('a class_t, bool, bool) Property.readwrite
    val sortTypeProp : ('a class_t, recent_sort_type_t, recent_sort_type_t) Property.readwrite
  end
