structure GtkSourceLanguageManager :>
  GTK_SOURCE_LANGUAGE_MANAGER
    where type 'a class = 'a GtkSourceLanguageManagerClass.class
    where type 'a language_class = 'a GtkSourceLanguageClass.class =
  struct
    val getType_ = _import "gtk_source_language_manager_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_language_manager_new" : unit -> GtkSourceLanguageManagerClass.FFI.non_opt GtkSourceLanguageManagerClass.FFI.p;
    val getDefault_ = _import "gtk_source_language_manager_get_default" : unit -> GtkSourceLanguageManagerClass.FFI.non_opt GtkSourceLanguageManagerClass.FFI.p;
    val getLanguage_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_language_manager_get_language" :
              GtkSourceLanguageManagerClass.FFI.non_opt GtkSourceLanguageManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkSourceLanguageClass.FFI.opt GtkSourceLanguageClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getLanguageIds_ = _import "gtk_source_language_manager_get_language_ids" : GtkSourceLanguageManagerClass.FFI.non_opt GtkSourceLanguageManagerClass.FFI.p -> Utf8CPtrArray.FFI.opt Utf8CPtrArray.FFI.out_p;
    val getSearchPath_ = _import "gtk_source_language_manager_get_search_path" : GtkSourceLanguageManagerClass.FFI.non_opt GtkSourceLanguageManagerClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val guessLanguage_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_gtk_source_language_manager_guess_language" :
              GtkSourceLanguageManagerClass.FFI.non_opt GtkSourceLanguageManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GtkSourceLanguageClass.FFI.opt GtkSourceLanguageClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setSearchPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_language_manager_set_search_path" :
              GtkSourceLanguageManagerClass.FFI.non_opt GtkSourceLanguageManagerClass.FFI.p
               * Utf8CPtrArray.MLton.p1
               * Utf8CPtrArray.FFI.opt Utf8CPtrArray.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkSourceLanguageManagerClass.class
    type 'a language_class = 'a GtkSourceLanguageClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceLanguageManagerClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkSourceLanguageManagerClass.FFI.fromPtr false) getDefault_ ()
    fun getLanguage self id = (GtkSourceLanguageManagerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkSourceLanguageClass.FFI.fromOptPtr false) getLanguage_ (self & id)
    fun getLanguageIds self = (GtkSourceLanguageManagerClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromOptPtr 0) getLanguageIds_ self
    fun getSearchPath self = (GtkSourceLanguageManagerClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 0) getSearchPath_ self
    fun guessLanguage self (filename, contentType) =
      (
        GtkSourceLanguageManagerClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> GtkSourceLanguageClass.FFI.fromOptPtr false
      )
        guessLanguage_
        (
          self
           & filename
           & contentType
        )
    fun setSearchPath self dirs = (GtkSourceLanguageManagerClass.FFI.withPtr false &&&> Utf8CPtrArray.FFI.withOptPtr 0 ---> I) setSearchPath_ (self & dirs)
  end
