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
    val atWordBoundariesProp : ('a class, bool, bool) Property.readwrite
    val caseSensitiveProp : ('a class, bool, bool) Property.readwrite
    val regexEnabledProp : ('a class, bool, bool) Property.readwrite
    val searchTextProp : ('a class, string option, string option) Property.readwrite
    val wrapAroundProp : ('a class, bool, bool) Property.readwrite
  end
