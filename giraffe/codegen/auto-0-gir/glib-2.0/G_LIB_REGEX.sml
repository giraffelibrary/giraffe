signature G_LIB_REGEX =
  sig
    type record_t
    type matchinforecord_t
    type regexmatchflags_t
    type regexcompileflags_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> regexcompileflags_t
       -> regexmatchflags_t
       -> record_t
    val getCaptureCount : record_t -> LargeInt.int
    val getCompileFlags : record_t -> regexcompileflags_t
    val getMatchFlags : record_t -> regexmatchflags_t
    val getMaxBackref : record_t -> LargeInt.int
    val getPattern : record_t -> string
    val getStringNumber :
      record_t
       -> string
       -> LargeInt.int
    val match :
      record_t
       -> string
       -> regexmatchflags_t
       -> matchinforecord_t option
    val matchAll :
      record_t
       -> string
       -> regexmatchflags_t
       -> matchinforecord_t option
    val checkReplacement : string -> bool option
    val escapeNul :
      string
       -> LargeInt.int
       -> string
    val matchSimple :
      string
       -> string
       -> regexcompileflags_t
       -> regexmatchflags_t
       -> bool
  end
