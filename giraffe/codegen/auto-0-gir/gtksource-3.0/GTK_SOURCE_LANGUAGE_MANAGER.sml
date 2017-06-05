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
       -> base language_class
    val getLanguageIds : 'a class -> string list
    val getSearchPath : 'a class -> string list
    val guessLanguage :
      'a class
       -> string option
       -> string option
       -> base language_class
    val setSearchPath :
      'a class
       -> string list option
       -> unit
  end
