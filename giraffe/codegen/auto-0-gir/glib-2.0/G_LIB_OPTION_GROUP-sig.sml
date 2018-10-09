signature G_LIB_OPTION_GROUP =
  sig
    type t
    type option_entry_t
    val getType : unit -> GObject.Type.t
    val addEntries :
      t
       -> option_entry_t
       -> unit
    val setTranslationDomain :
      t
       -> string
       -> unit
  end
