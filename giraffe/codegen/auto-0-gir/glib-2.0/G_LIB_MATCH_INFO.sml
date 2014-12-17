signature G_LIB_MATCH_INFO =
  sig
    type record_t
    type regexrecord_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val expandReferences :
      record_t
       -> string
       -> string
    val fetch :
      record_t
       -> LargeInt.int
       -> string
    val fetchNamed :
      record_t
       -> string
       -> string
    val fetchNamedPos :
      record_t
       -> string
       -> (LargeInt.int * LargeInt.int) option
    val fetchPos :
      record_t
       -> LargeInt.int
       -> (LargeInt.int * LargeInt.int) option
    val getMatchCount : record_t -> LargeInt.int
    val getRegex : record_t -> regexrecord_t
    val getString : record_t -> string
    val isPartialMatch : record_t -> bool
    val matches : record_t -> bool
    val next : record_t -> bool
  end
