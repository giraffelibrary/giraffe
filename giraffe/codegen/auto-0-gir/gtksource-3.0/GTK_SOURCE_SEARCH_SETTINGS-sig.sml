signature GTK_SOURCE_SEARCH_SETTINGS =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getAtWordBoundaries : 'a class -> bool
    val getCaseSensitive : 'a class -> bool
    val getRegexEnabled : 'a class -> bool
    val getSearchText : 'a class -> string option
    val getWrapAround : 'a class -> bool
    val setAtWordBoundaries :
      'a class
       -> bool
       -> unit
    val setCaseSensitive :
      'a class
       -> bool
       -> unit
    val setRegexEnabled :
      'a class
       -> bool
       -> unit
    val setSearchText :
      'a class
       -> string option
       -> unit
    val setWrapAround :
      'a class
       -> bool
       -> unit
    val atWordBoundariesProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val caseSensitiveProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val regexEnabledProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val searchTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val wrapAroundProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
