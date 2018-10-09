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
    val atWordBoundariesProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val caseSensitiveProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val regexEnabledProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val searchTextProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val wrapAroundProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
