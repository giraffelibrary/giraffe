structure PangoLanguage :>
  PANGO_LANGUAGE
    where type t = PangoLanguageRecord.t
    where type script_c_array_n_t = PangoScriptCArrayN.t
    where type script_t = PangoScript.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_language_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getSampleString_ = call (getSymbol "pango_language_get_sample_string") (PangoLanguageRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getScripts_ = call (getSymbol "pango_language_get_scripts") (PangoLanguageRecord.PolyML.cPtr &&> GInt32.PolyML.cRef --> PangoScriptCArrayN.PolyML.cOutOptPtr)
      val includesScript_ = call (getSymbol "pango_language_includes_script") (PangoLanguageRecord.PolyML.cPtr &&> PangoScript.PolyML.cVal --> GBool.PolyML.cVal)
      val matches_ = call (getSymbol "pango_language_matches") (PangoLanguageRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val toString_ = call (getSymbol "pango_language_to_string") (PangoLanguageRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val fromString_ = call (getSymbol "pango_language_from_string") (Utf8.PolyML.cInOptPtr --> PangoLanguageRecord.PolyML.cOptPtr)
      val getDefault_ = call (getSymbol "pango_language_get_default") (cVoid --> PangoLanguageRecord.PolyML.cPtr)
    end
    type t = PangoLanguageRecord.t
    type script_c_array_n_t = PangoScriptCArrayN.t
    type script_t = PangoScript.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getSampleString self = (PangoLanguageRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getSampleString_ self before PangoLanguageRecord.FFI.touchPtr self
    fun getScripts self =
      let
        val numScripts & retVal = (PangoLanguageRecord.FFI.withPtr false &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && PangoScriptCArrayN.FFI.fromOptPtr 0) getScripts_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt numScripts) before PangoLanguageRecord.FFI.touchPtr self
      end
    fun includesScript self script = (PangoLanguageRecord.FFI.withPtr false &&&> PangoScript.FFI.withVal ---> GBool.FFI.fromVal) includesScript_ (self & script)
    fun matches self rangeList = (PangoLanguageRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) matches_ (self & rangeList)
    fun toString self = (PangoLanguageRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) toString_ self before PangoLanguageRecord.FFI.touchPtr self
    fun fromString language = (Utf8.FFI.withOptPtr 0 ---> PangoLanguageRecord.FFI.fromOptPtr false) fromString_ language before Utf8.FFI.touchOptPtr language
    fun getDefault () = (I ---> PangoLanguageRecord.FFI.fromPtr false) getDefault_ ()
  end
