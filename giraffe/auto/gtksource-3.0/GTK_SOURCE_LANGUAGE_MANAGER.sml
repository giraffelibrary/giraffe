signature GTK_SOURCE_LANGUAGE_MANAGER =
  sig
    type 'a class_t
    type 'a languageclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getDefault : unit -> base class_t
    val getLanguage :
      'a class_t
       -> string
       -> base languageclass_t
    val guessLanguage :
      'a class_t
       -> string option
       -> string option
       -> base languageclass_t
  end
