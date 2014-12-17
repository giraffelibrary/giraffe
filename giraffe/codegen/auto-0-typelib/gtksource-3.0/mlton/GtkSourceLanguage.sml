structure GtkSourceLanguage :>
  GTK_SOURCE_LANGUAGE
    where type 'a class_t = 'a GtkSourceLanguageClass.t =
  struct
    val getType_ = _import "gtk_source_language_get_type" : unit -> GObjectType.C.val_;
    val getHidden_ = _import "gtk_source_language_get_hidden" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getId_ = _import "gtk_source_language_get_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getMetadata_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_language_get_metadata" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    val getName_ = _import "gtk_source_language_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getSection_ = _import "gtk_source_language_get_section" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getStyleName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_source_language_get_style_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.String.C.notnull FFI.String.C.out_p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GtkSourceLanguageClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHidden self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHidden_ self
    fun getId self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getId_ self
    fun getMetadata self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getMetadata_ (self & name)
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getSection self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getSection_ self
    fun getStyleName self styleId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr false) getStyleName_ (self & styleId)
    local
      open Property
    in
      val hiddenProp = {get = fn x => get "hidden" boolean x}
      val idProp = {get = fn x => get "id" stringOpt x}
      val nameProp = {get = fn x => get "name" stringOpt x}
      val sectionProp = {get = fn x => get "section" stringOpt x}
    end
  end
