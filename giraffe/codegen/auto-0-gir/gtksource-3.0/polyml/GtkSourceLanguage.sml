structure GtkSourceLanguage :>
  GTK_SOURCE_LANGUAGE
    where type 'a class_t = 'a GtkSourceLanguageClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_language_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getHidden_ = call (load_sym libgtksourceview "gtk_source_language_get_hidden") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getId_ = call (load_sym libgtksourceview "gtk_source_language_get_id") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMetadata_ = call (load_sym libgtksourceview "gtk_source_language_get_metadata") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (load_sym libgtksourceview "gtk_source_language_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSection_ = call (load_sym libgtksourceview "gtk_source_language_get_section") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyleName_ = call (load_sym libgtksourceview "gtk_source_language_get_style_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class_t = 'a GtkSourceLanguageClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHidden_ self
    fun getId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getId_ self
    fun getMetadata self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getMetadata_ (self & name)
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getSection self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getSection_ self
    fun getStyleName self styleId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> Utf8.C.fromPtr false) getStyleName_ (self & styleId)
    local
      open Property
    in
      val hiddenProp = {get = fn x => get "hidden" boolean x}
      val idProp = {get = fn x => get "id" stringOpt x}
      val nameProp = {get = fn x => get "name" stringOpt x}
      val sectionProp = {get = fn x => get "section" stringOpt x}
    end
  end
