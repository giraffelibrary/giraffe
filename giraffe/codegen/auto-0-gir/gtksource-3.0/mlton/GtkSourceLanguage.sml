structure GtkSourceLanguage :>
  GTK_SOURCE_LANGUAGE
    where type 'a class = 'a GtkSourceLanguageClass.class =
  struct
    val getType_ = _import "gtk_source_language_get_type" : unit -> GObjectType.C.val_;
    val getHidden_ = _import "gtk_source_language_get_hidden" : GtkSourceLanguageClass.C.notnull GtkSourceLanguageClass.C.p -> FFI.Bool.C.val_;
    val getId_ = _import "gtk_source_language_get_id" : GtkSourceLanguageClass.C.notnull GtkSourceLanguageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getMetadata_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_language_get_metadata" :
              GtkSourceLanguageClass.C.notnull GtkSourceLanguageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getName_ = _import "gtk_source_language_get_name" : GtkSourceLanguageClass.C.notnull GtkSourceLanguageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getSection_ = _import "gtk_source_language_get_section" : GtkSourceLanguageClass.C.notnull GtkSourceLanguageClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getStyleName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_language_get_style_name" :
              GtkSourceLanguageClass.C.notnull GtkSourceLanguageClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> Utf8.C.notnull Utf8.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
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
