structure GtkSourceLanguageManager :>
  GTK_SOURCE_LANGUAGE_MANAGER
    where type 'a class = 'a GtkSourceLanguageManagerClass.class
    where type 'a language_class = 'a GtkSourceLanguageClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_language_manager_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getDefault_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getLanguage_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_language") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val guessLanguage_ =
        call (load_sym libgtksourceview "gtk_source_language_manager_guess_language")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GtkSourceLanguageManagerClass.class
    type 'a language_class = 'a GtkSourceLanguageClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceLanguageManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceLanguageManagerClass.C.fromPtr false) getDefault_ ()
    fun getLanguage self id = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkSourceLanguageClass.C.fromPtr false) getLanguage_ (self & id)
    fun guessLanguage self filename contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         ---> GtkSourceLanguageClass.C.fromPtr false
      )
        guessLanguage_
        (
          self
           & filename
           & contentType
        )
  end
