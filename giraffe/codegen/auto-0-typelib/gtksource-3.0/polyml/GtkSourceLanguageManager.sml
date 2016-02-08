structure GtkSourceLanguageManager :>
  GTK_SOURCE_LANGUAGE_MANAGER
    where type 'a class_t = 'a GtkSourceLanguageManagerClass.t
    where type 'a language_class_t = 'a GtkSourceLanguageClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtksourceview "gtk_source_language_manager_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDefault_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getLanguage_ = call (load_sym libgtksourceview "gtk_source_language_manager_get_language") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val guessLanguage_ =
        call (load_sym libgtksourceview "gtk_source_language_manager_guess_language")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INOPTPTR
             &&> Utf8.PolyML.INOPTPTR
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type 'a class_t = 'a GtkSourceLanguageManagerClass.t
    type 'a language_class_t = 'a GtkSourceLanguageClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceLanguageManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceLanguageManagerClass.C.fromPtr false) getDefault_ ()
    fun getLanguage self id = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> GtkSourceLanguageClass.C.fromPtr false) getLanguage_ (self & id)
    fun guessLanguage self filename contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withConstOptPtr
         &&&> Utf8.C.withConstOptPtr
         ---> GtkSourceLanguageClass.C.fromPtr false
      )
        guessLanguage_
        (
          self
           & filename
           & contentType
        )
  end
