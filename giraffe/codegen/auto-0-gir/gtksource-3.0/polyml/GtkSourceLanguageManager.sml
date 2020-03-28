structure GtkSourceLanguageManager :>
  GTK_SOURCE_LANGUAGE_MANAGER
    where type 'a class = 'a GtkSourceLanguageManagerClass.class
    where type 'a language_class = 'a GtkSourceLanguageClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_language_manager_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_language_manager_new") (cVoid --> GtkSourceLanguageManagerClass.PolyML.cPtr)
      val getDefault_ = call (getSymbol "gtk_source_language_manager_get_default") (cVoid --> GtkSourceLanguageManagerClass.PolyML.cPtr)
      val getLanguage_ = call (getSymbol "gtk_source_language_manager_get_language") (GtkSourceLanguageManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSourceLanguageClass.PolyML.cOptPtr)
      val getLanguageIds_ = call (getSymbol "gtk_source_language_manager_get_language_ids") (GtkSourceLanguageManagerClass.PolyML.cPtr --> Utf8CArray.PolyML.cOutOptPtr)
      val getSearchPath_ = call (getSymbol "gtk_source_language_manager_get_search_path") (GtkSourceLanguageManagerClass.PolyML.cPtr --> Utf8CArray.PolyML.cOutPtr)
      val guessLanguage_ =
        call (getSymbol "gtk_source_language_manager_guess_language")
          (
            GtkSourceLanguageManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkSourceLanguageClass.PolyML.cOptPtr
          )
      val setSearchPath_ = call (getSymbol "gtk_source_language_manager_set_search_path") (GtkSourceLanguageManagerClass.PolyML.cPtr &&> Utf8CArray.PolyML.cInOptPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceLanguageManagerClass.class
    type 'a language_class = 'a GtkSourceLanguageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceLanguageManagerClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceLanguageManagerClass.FFI.fromPtr false) getDefault_ ()
    fun getLanguage self id = (GtkSourceLanguageManagerClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceLanguageClass.FFI.fromOptPtr false) getLanguage_ (self & id)
    fun getLanguageIds self = (GtkSourceLanguageManagerClass.FFI.withPtr ---> Utf8CArray.FFI.fromOptPtr 0) getLanguageIds_ self
    fun getSearchPath self = (GtkSourceLanguageManagerClass.FFI.withPtr ---> Utf8CArray.FFI.fromPtr 0) getSearchPath_ self
    fun guessLanguage self (filename, contentType) =
      (
        GtkSourceLanguageManagerClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GtkSourceLanguageClass.FFI.fromOptPtr false
      )
        guessLanguage_
        (
          self
           & filename
           & contentType
        )
    fun setSearchPath self dirs = (GtkSourceLanguageManagerClass.FFI.withPtr &&&> Utf8CArray.FFI.withOptPtr ---> I) setSearchPath_ (self & dirs)
  end
