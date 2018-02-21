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
    val getType_ = _import "pango_language_get_type" : unit -> GObjectType.FFI.val_;
    val getSampleString_ = _import "pango_language_get_sample_string" : PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getScripts_ = fn x1 & x2 => (_import "pango_language_get_scripts" : PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p * GInt.FFI.ref_ -> unit PangoScriptCVectorN.FFI.out_p;) (x1, x2)
    val includesScript_ = fn x1 & x2 => (_import "pango_language_includes_script" : PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p * PangoScript.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val matches_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_pango_language_matches" :
              PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "pango_language_to_string" : PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val fromString_ = _import "mlton_pango_language_from_string" : Utf8.MLton.p1 * unit Utf8.MLton.p2 -> unit PangoLanguageRecord.FFI.p;
    val getDefault_ = _import "pango_language_get_default" : unit -> PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p;
    type t = PangoLanguageRecord.t
    type script_t = PangoScript.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getSampleString self = (PangoLanguageRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSampleString_ self
    fun getScripts self =
      let
        val numScripts & retVal = (PangoLanguageRecord.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && PangoScriptCVectorN.FFI.fromOptPtr 0) getScripts_ (self & GInt.null)
      in
        retVal (LargeInt.toInt numScripts)
      end
    fun includesScript self script = (PangoLanguageRecord.FFI.withPtr &&&> PangoScript.FFI.withVal ---> GBool.FFI.fromVal) includesScript_ (self & script)
    fun matches self rangeList = (PangoLanguageRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) matches_ (self & rangeList)
    fun toString self = (PangoLanguageRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) toString_ self
    fun fromString language = (Utf8.FFI.withOptPtr ---> PangoLanguageRecord.FFI.fromOptPtr false) fromString_ language
    fun getDefault () = (I ---> PangoLanguageRecord.FFI.fromPtr false) getDefault_ ()
  end
