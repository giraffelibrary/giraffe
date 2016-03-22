structure GtkSourceLanguage :>
  GTK_SOURCE_LANGUAGE
    where type 'a class = 'a GtkSourceLanguageClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_language_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getHidden_ = call (load_sym libgtksourceview "gtk_source_language_get_hidden") (GtkSourceLanguageClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getId_ = call (load_sym libgtksourceview "gtk_source_language_get_id") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMetadata_ = call (load_sym libgtksourceview "gtk_source_language_get_metadata") (GtkSourceLanguageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (load_sym libgtksourceview "gtk_source_language_get_name") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSection_ = call (load_sym libgtksourceview "gtk_source_language_get_section") (GtkSourceLanguageClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyleName_ = call (load_sym libgtksourceview "gtk_source_language_get_style_name") (GtkSourceLanguageClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GtkSourceLanguageClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHidden self = (GtkSourceLanguageClass.C.withPtr ---> FFI.Bool.C.fromVal) getHidden_ self
    fun getId self = (GtkSourceLanguageClass.C.withPtr ---> Utf8.C.fromPtr false) getId_ self
    fun getMetadata self name = (GtkSourceLanguageClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getMetadata_ (self & name)
    fun getName self = (GtkSourceLanguageClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getSection self = (GtkSourceLanguageClass.C.withPtr ---> Utf8.C.fromPtr false) getSection_ self
    fun getStyleName self styleId = (GtkSourceLanguageClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getStyleName_ (self & styleId)
    local
      open Property
    in
      val hiddenProp = {get = fn x => get "hidden" boolean x}
      val idProp = {get = fn x => get "id" stringOpt x}
      val nameProp = {get = fn x => get "name" stringOpt x}
      val sectionProp = {get = fn x => get "section" stringOpt x}
    end
  end
