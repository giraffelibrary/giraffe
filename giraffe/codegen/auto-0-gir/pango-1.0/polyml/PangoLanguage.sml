structure PangoLanguage :>
  PANGO_LANGUAGE
    where type t = PangoLanguageRecord.t
    where type script_t = PangoScript.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_language_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getSampleString_ = call (load_sym libpango "pango_language_get_sample_string") (PangoLanguageRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val includesScript_ = call (load_sym libpango "pango_language_includes_script") (PangoLanguageRecord.PolyML.cPtr &&> PangoScript.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val matches_ = call (load_sym libpango "pango_language_matches") (PangoLanguageRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val toString_ = call (load_sym libpango "pango_language_to_string") (PangoLanguageRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val fromString_ = call (load_sym libpango "pango_language_from_string") (Utf8.PolyML.cInOptPtr --> PangoLanguageRecord.PolyML.cPtr)
      val getDefault_ = call (load_sym libpango "pango_language_get_default") (FFI.PolyML.cVoid --> PangoLanguageRecord.PolyML.cPtr)
    end
    type t = PangoLanguageRecord.t
    type script_t = PangoScript.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getSampleString self = (PangoLanguageRecord.C.withPtr ---> Utf8.C.fromPtr false) getSampleString_ self
    fun includesScript self script = (PangoLanguageRecord.C.withPtr &&&> PangoScript.C.withVal ---> FFI.Bool.C.fromVal) includesScript_ (self & script)
    fun matches self rangeList = (PangoLanguageRecord.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) matches_ (self & rangeList)
    fun toString self = (PangoLanguageRecord.C.withPtr ---> Utf8.C.fromPtr false) toString_ self
    fun fromString language = (Utf8.C.withOptPtr ---> PangoLanguageRecord.C.fromPtr true) fromString_ language
    fun getDefault () = (I ---> PangoLanguageRecord.C.fromPtr true) getDefault_ ()
  end
