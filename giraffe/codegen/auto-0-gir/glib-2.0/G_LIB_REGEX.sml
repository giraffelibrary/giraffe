signature G_LIB_REGEX =
  sig
    type t
    type match_info_t
    type regex_match_flags_t
    type regex_compile_flags_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       * regex_compile_flags_t
       * regex_match_flags_t
       -> t
    val getCaptureCount : t -> LargeInt.int
    val getCompileFlags : t -> regex_compile_flags_t
    val getHasCrOrLf : t -> bool
    val getMatchFlags : t -> regex_match_flags_t
    val getMaxBackref : t -> LargeInt.int
    val getMaxLookbehind : t -> LargeInt.int
    val getPattern : t -> string
    val getStringNumber :
      t
       -> string
       -> LargeInt.int
    val match :
      t
       -> string * regex_match_flags_t
       -> match_info_t option
    val matchAll :
      t
       -> string * regex_match_flags_t
       -> match_info_t option
    val matchAllFull :
      t
       -> string list
           * LargeInt.int
           * regex_match_flags_t
       -> match_info_t
    val matchFull :
      t
       -> string list
           * LargeInt.int
           * regex_match_flags_t
       -> match_info_t
    val replace :
      t
       -> string list
           * LargeInt.int
           * string
           * regex_match_flags_t
       -> string
    val replaceLiteral :
      t
       -> string list
           * LargeInt.int
           * string
           * regex_match_flags_t
       -> string
    val split :
      t
       -> string * regex_match_flags_t
       -> string list
    val splitFull :
      t
       -> string list
           * LargeInt.int
           * regex_match_flags_t
           * LargeInt.int
       -> string list
    val checkReplacement : string -> bool
    val escapeNul : string * LargeInt.int -> string
    val matchSimple :
      string
       * string
       * regex_compile_flags_t
       * regex_match_flags_t
       -> bool
    val splitSimple :
      string
       * string
       * regex_compile_flags_t
       * regex_match_flags_t
       -> string list
  end
