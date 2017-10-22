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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_language_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getGlobs_ = call (getSymbol "gtk_source_language_get_globs") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutOptPtr)
      val getHidden_ = call (getSymbol "gtk_source_language_get_hidden") (GtkSourceLanguageClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getId_ = call (getSymbol "gtk_source_language_get_id") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMetadata_ = call (getSymbol "gtk_source_language_get_metadata") (GtkSourceLanguageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
      val getMimeTypes_ = call (getSymbol "gtk_source_language_get_mime_types") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutOptPtr)
      val getName_ = call (getSymbol "gtk_source_language_get_name") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSection_ = call (getSymbol "gtk_source_language_get_section") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyleFallback_ = call (getSymbol "gtk_source_language_get_style_fallback") (GtkSourceLanguageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
      val getStyleIds_ = call (getSymbol "gtk_source_language_get_style_ids") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutOptPtr)
      val getStyleName_ = call (getSymbol "gtk_source_language_get_style_name") (GtkSourceLanguageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
    end
    type 'a class = 'a GtkSourceLanguageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getGlobs self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8CVector.FFI.fromOptPtr 2) getGlobs_ self
    fun getHidden self = (GtkSourceLanguageClass.FFI.withPtr ---> GBool.FFI.fromVal) getHidden_ self
    fun getId self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getId_ self
    fun getMetadata self name = (GtkSourceLanguageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getMetadata_ (self & name)
    fun getMimeTypes self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8CVector.FFI.fromOptPtr 2) getMimeTypes_ self
    fun getName self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getSection self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSection_ self
    fun getStyleFallback self styleId = (GtkSourceLanguageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getStyleFallback_ (self & styleId)
    fun getStyleIds self = (GtkSourceLanguageClass.FFI.withPtr ---> Utf8CVector.FFI.fromOptPtr 2) getStyleIds_ self
    fun getStyleName self styleId = (GtkSourceLanguageClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getStyleName_ (self & styleId)
    local
      open Property
    in
      val hiddenProp = {get = fn x => get "hidden" boolean x}
      val idProp = {get = fn x => get "id" stringOpt x}
      val nameProp = {get = fn x => get "name" stringOpt x}
      val sectionProp = {get = fn x => get "section" stringOpt x}
    end
  end
