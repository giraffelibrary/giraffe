structure PangoLanguage :>
  PANGO_LANGUAGE
    where type t = PangoLanguageRecord.t
    where type script_t = PangoScript.t =
  struct
    val getType_ = _import "pango_language_get_type" : unit -> GObjectType.C.val_;
    val getSampleString_ = _import "pango_language_get_sample_string" : PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val includesScript_ = fn x1 & x2 => (_import "pango_language_includes_script" : PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p * PangoScript.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val matches_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_pango_language_matches" :
              PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = _import "pango_language_to_string" : PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val fromString_ = _import "mlton_pango_language_from_string" : Utf8.MLton.p1 * unit Utf8.MLton.p2 -> PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p;
    val getDefault_ = _import "pango_language_get_default" : unit -> PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p;
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
