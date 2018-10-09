signature GTK_INPUT_HINTS =
  sig
    include FLAGS
    val NONE : t
    val SPELLCHECK : t
    val NO_SPELLCHECK : t
    val WORD_COMPLETION : t
    val LOWERCASE : t
    val UPPERCASE_CHARS : t
    val UPPERCASE_WORDS : t
    val UPPERCASE_SENTENCES : t
    val INHIBIT_OSK : t
    val VERTICAL_WRITING : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
