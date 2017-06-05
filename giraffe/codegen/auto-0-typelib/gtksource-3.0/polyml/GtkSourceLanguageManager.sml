structure GtkSourceLanguageManager :>
  GTK_SOURCE_LANGUAGE_MANAGER
    where type 'a class = 'a GtkSourceLanguageManagerClass.class
    where type 'a language_class = 'a GtkSourceLanguageClass.class =
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
      val getType_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtksourceview "gtk_source_language_manager_new") (PolyMLFFI.cVoid --> GtkSourceLanguageManagerClass.PolyML.cPtr)
      val getDefault_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_default") (PolyMLFFI.cVoid --> GtkSourceLanguageManagerClass.PolyML.cPtr)
      val getLanguage_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_language") (GtkSourceLanguageManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSourceLanguageClass.PolyML.cPtr)
      val getLanguageIds_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_language_ids") (GtkSourceLanguageManagerClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val getSearchPath_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_search_path") (GtkSourceLanguageManagerClass.PolyML.cPtr --> Utf8CVector.PolyML.cOutPtr)
      val guessLanguage_ =
        call (load_sym libgtksourceview "gtk_source_language_manager_guess_language")
          (
            GtkSourceLanguageManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkSourceLanguageClass.PolyML.cPtr
          )
      val setSearchPath_ = call (load_sym libgtksourceview "gtk_source_language_manager_set_search_path") (GtkSourceLanguageManagerClass.PolyML.cPtr &&> Utf8CVector.PolyML.cInOptPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkSourceLanguageManagerClass.class
    type 'a language_class = 'a GtkSourceLanguageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceLanguageManagerClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceLanguageManagerClass.FFI.fromPtr false) getDefault_ ()
    fun getLanguage self id = (GtkSourceLanguageManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceLanguageClass.FFI.fromPtr false) getLanguage_ (self & id)
    fun getLanguageIds self = (GtkSourceLanguageManagerClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getLanguageIds_ self
    fun getSearchPath self = (GtkSourceLanguageManagerClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getSearchPath_ self
    fun guessLanguage self filename contentType =
      (
        GtkSourceLanguageManagerClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GtkSourceLanguageClass.FFI.fromPtr false
      )
        guessLanguage_
        (
          self
           & filename
           & contentType
        )
    fun setSearchPath self dirs = (GtkSourceLanguageManagerClass.FFI.withPtr &&&> Utf8CVector.FFI.withOptPtr ---> I) setSearchPath_ (self & dirs)
  end
