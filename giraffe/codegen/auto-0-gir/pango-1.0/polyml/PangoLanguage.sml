structure PangoLanguage :>
  PANGO_LANGUAGE
    where type t = PangoLanguageRecord.t
    where type script_t = PangoScript.t =
  struct
    structure PangoScriptCVectorNType =
      CValueCVectorNType(
        structure CElemType = PangoScript.C.ValueType
        structure ElemSequence = CValueVectorSequence(PangoScript.C.ValueType)
      )
    structure PangoScriptCVectorN = CVectorN(PangoScriptCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_language_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getSampleString_ = call (getSymbol "pango_language_get_sample_string") (PangoLanguageRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getScripts_ = call (getSymbol "pango_language_get_scripts") (PangoLanguageRecord.PolyML.cPtr &&> GInt.PolyML.cRef --> PangoScriptCVectorN.PolyML.cOutPtr)
      val includesScript_ = call (getSymbol "pango_language_includes_script") (PangoLanguageRecord.PolyML.cPtr &&> PangoScript.PolyML.cVal --> GBool.PolyML.cVal)
      val matches_ = call (getSymbol "pango_language_matches") (PangoLanguageRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val toString_ = call (getSymbol "pango_language_to_string") (PangoLanguageRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val fromString_ = call (getSymbol "pango_language_from_string") (Utf8.PolyML.cInOptPtr --> PangoLanguageRecord.PolyML.cPtr)
      val getDefault_ = call (getSymbol "pango_language_get_default") (cVoid --> PangoLanguageRecord.PolyML.cPtr)
    end
    type t = PangoLanguageRecord.t
    type script_t = PangoScript.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getSampleString self = (PangoLanguageRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSampleString_ self
    fun getScripts self =
      let
        val numScripts & retVal = (PangoLanguageRecord.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && PangoScriptCVectorN.FFI.fromPtr 0) getScripts_ (self & GInt.null)
      in
        retVal (LargeInt.toInt numScripts)
      end
    fun includesScript self script = (PangoLanguageRecord.FFI.withPtr &&&> PangoScript.FFI.withVal ---> GBool.FFI.fromVal) includesScript_ (self & script)
    fun matches self rangeList = (PangoLanguageRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) matches_ (self & rangeList)
    fun toString self = (PangoLanguageRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) toString_ self
    fun fromString language = (Utf8.FFI.withOptPtr ---> PangoLanguageRecord.FFI.fromPtr false) fromString_ language
    fun getDefault () = (I ---> PangoLanguageRecord.FFI.fromPtr false) getDefault_ ()
  end
