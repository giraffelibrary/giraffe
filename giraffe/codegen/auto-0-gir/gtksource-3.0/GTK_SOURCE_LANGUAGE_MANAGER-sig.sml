signature GTK_SOURCE_LANGUAGE_MANAGER =
  sig
    type 'a class
    type 'a language_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getDefault : unit -> base class
    val getLanguage :
      'a class
       -> string
       -> base language_class option
    val getLanguageIds : 'a class -> Utf8CArray.t option
    val getSearchPath : 'a class -> Utf8CArray.t
    val guessLanguage :
      'a class
       -> string option * string option
       -> base language_class option
    val setSearchPath :
      'a class
       -> Utf8CArray.t option
       -> unit
  end
