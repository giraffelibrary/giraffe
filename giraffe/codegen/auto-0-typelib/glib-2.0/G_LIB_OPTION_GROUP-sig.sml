signature G_LIB_OPTION_GROUP =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val setTranslationDomain :
      t
       -> string
       -> unit
  end
