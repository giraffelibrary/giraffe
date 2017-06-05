structure GtkSourceLanguage :>
  GTK_SOURCE_LANGUAGE
    where type 'a class = 'a GtkSourceLanguageClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val getType_ = _import "gtk_source_language_get_type" : unit -> GObjectType.FFI.val_;
    val getGlobs_ = _import "gtk_source_language_get_globs" : GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getHidden_ = _import "gtk_source_language_get_hidden" : GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p -> GBool.FFI.val_;
    val getId_ = _import "gtk_source_language_get_id" : GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getMetadata_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_language_get_metadata" :
              GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getMimeTypes_ = _import "gtk_source_language_get_mime_types" : GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getName_ = _import "gtk_source_language_get_name" : GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getSection_ = _import "gtk_source_language_get_section" : GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getStyleIds_ = _import "gtk_source_language_get_style_ids" : GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val getStyleName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_language_get_style_name" :
              GtkSourceLanguageClass.FFI.notnull GtkSourceLanguageClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> Utf8.FFI.notnull Utf8.FFI.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceLanguageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getGlobs self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getGlobs_ self
    fun getHidden self = (GtkSourceLanguageClass.FFI.withPtr ---> GBool.FFI.fromVal) getHidden_ self
    fun getId self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getId_ self
    fun getMetadata self name = (GtkSourceLanguageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getMetadata_ (self & name)
    fun getMimeTypes self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getMimeTypes_ self
    fun getName self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getSection self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSection_ self
    fun getStyleIds self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 2) getStyleIds_ self
    fun getStyleName self styleId = (GtkSourceLanguageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getStyleName_ (self & styleId)
    local
      open Property
    in
      val hiddenProp = {get = fn x => get "hidden" boolean x}
      val idProp = {get = fn x => get "id" stringOpt x}
      val nameProp = {get = fn x => get "name" stringOpt x}
      val sectionProp = {get = fn x => get "section" stringOpt x}
    end
  end
