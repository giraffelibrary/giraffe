signature G_LIB_MATCH_INFO =
  sig
    type t
    type regex_t
    val getType : unit -> GObject.Type.t
    val expandReferences :
      t
       -> string
       -> string option
    val fetch :
      t
       -> LargeInt.int
       -> string option
    val fetchAll : t -> Utf8CArray.t
    val fetchNamed :
      t
       -> string
       -> string option
    val fetchNamedPos :
      t
       -> string
       -> (LargeInt.int * LargeInt.int) option
    val fetchPos :
      t
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
    val getMatchCount : t -> LargeInt.int
    val getRegex : t -> regex_t
    val getString : t -> string
    val isPartialMatch : t -> bool
    val matches : t -> bool
    val next : t -> unit
  end
