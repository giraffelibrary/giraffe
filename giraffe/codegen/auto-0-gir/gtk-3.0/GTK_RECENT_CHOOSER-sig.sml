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
    val getUris : 'a class -> Utf8CArrayN.t
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
    val filterProp :
      {
        get : 'a class -> base recent_filter_class option,
        set :
          'b recent_filter_class option
           -> 'a class
           -> unit,
        new : 'b recent_filter_class option -> 'a class Property.t
      }
    val limitProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val localOnlyProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val recentManagerProp : {new : 'b recent_manager_class option -> 'a class Property.t}
    val selectMultipleProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showIconsProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showNotFoundProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showPrivateProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showTipsProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val sortTypeProp :
      {
        get : 'a class -> recent_sort_type_t,
        set :
          recent_sort_type_t
           -> 'a class
           -> unit,
        new : recent_sort_type_t -> 'a class Property.t
      }
  end
