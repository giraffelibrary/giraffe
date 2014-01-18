structure PangoLanguage :>
  PANGO_LANGUAGE
    where type record_t = PangoLanguageRecord.t
    where type script_t = PangoScript.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_language_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getSampleString_ = call (load_sym libpango "pango_language_get_sample_string") (PangoLanguageRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val includesScript_ = call (load_sym libpango "pango_language_includes_script") (PangoLanguageRecord.PolyML.PTR &&> PangoScript.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val matches_ = call (load_sym libpango "pango_language_matches") (PangoLanguageRecord.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val toString_ = call (load_sym libpango "pango_language_to_string") (PangoLanguageRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val fromString_ = call (load_sym libpango "pango_language_from_string") (FFI.String.PolyML.INOPTPTR --> PangoLanguageRecord.PolyML.PTR)
      val getDefault_ = call (load_sym libpango "pango_language_get_default") (FFI.PolyML.VOID --> PangoLanguageRecord.PolyML.PTR)
    end
    type record_t = PangoLanguageRecord.t
    type script_t = PangoScript.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getSampleString self = (PangoLanguageRecord.C.withPtr ---> FFI.String.C.fromPtr false) getSampleString_ self
    fun includesScript self script = (PangoLanguageRecord.C.withPtr &&&> PangoScript.C.withVal ---> FFI.Bool.C.fromVal) includesScript_ (self & script)
    fun matches self rangeList = (PangoLanguageRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) matches_ (self & rangeList)
    fun toString self = (PangoLanguageRecord.C.withPtr ---> FFI.String.C.fromPtr false) toString_ self
    fun fromString language = (FFI.String.C.withConstOptPtr ---> PangoLanguageRecord.C.fromPtr true) fromString_ language
    fun getDefault () = (I ---> PangoLanguageRecord.C.fromPtr true) getDefault_ ()
  end