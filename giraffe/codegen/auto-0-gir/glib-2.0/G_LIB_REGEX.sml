signature G_LIB_REGEX =
  sig
    type record_t
    type match_info_record_t
    type regex_match_flags_t
    type regex_compile_flags_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> regex_compile_flags_t
       -> regex_match_flags_t
       -> record_t
    val getCaptureCount : record_t -> LargeInt.int
    val getCompileFlags : record_t -> regex_compile_flags_t
    val getMatchFlags : record_t -> regex_match_flags_t
    val getMaxBackref : record_t -> LargeInt.int
    val getPattern : record_t -> string
    val getStringNumber :
      record_t
       -> string
       -> LargeInt.int
    val match :
      record_t
       -> string
       -> regex_match_flags_t
       -> match_info_record_t option
    val matchAll :
      record_t
       -> string
       -> regex_match_flags_t
       -> match_info_record_t option
    val checkReplacement : string -> bool option
    val escapeNul :
      string
       -> LargeInt.int
       -> string
    val matchSimple :
      string
       -> string
       -> regex_compile_flags_t
       -> regex_match_flags_t
       -> bool
  end
