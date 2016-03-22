structure GtkSourceLanguageManager :>
  GTK_SOURCE_LANGUAGE_MANAGER
    where type 'a class = 'a GtkSourceLanguageManagerClass.class
    where type 'a language_class = 'a GtkSourceLanguageClass.class =
  struct
    val getType_ = _import "gtk_source_language_manager_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_language_manager_new" : unit -> GtkSourceLanguageManagerClass.C.notnull GtkSourceLanguageManagerClass.C.p;
    val getDefault_ = _import "gtk_source_language_manager_get_default" : unit -> GtkSourceLanguageManagerClass.C.notnull GtkSourceLanguageManagerClass.C.p;
    val getLanguage_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_language_manager_get_language" :
              GtkSourceLanguageManagerClass.C.notnull GtkSourceLanguageManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkSourceLanguageClass.C.notnull GtkSourceLanguageClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val guessLanguage_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_source_language_manager_guess_language" :
              GtkSourceLanguageManagerClass.C.notnull GtkSourceLanguageManagerClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GtkSourceLanguageClass.C.notnull GtkSourceLanguageClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a GtkSourceLanguageManagerClass.class
    type 'a language_class = 'a GtkSourceLanguageClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceLanguageManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceLanguageManagerClass.C.fromPtr false) getDefault_ ()
    fun getLanguage self id = (GtkSourceLanguageManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkSourceLanguageClass.C.fromPtr false) getLanguage_ (self & id)
    fun guessLanguage self filename contentType =
      (
        GtkSourceLanguageManagerClass.C.withPtr
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
