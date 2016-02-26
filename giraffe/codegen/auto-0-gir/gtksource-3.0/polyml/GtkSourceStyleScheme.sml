structure GtkSourceStyleScheme :>
  GTK_SOURCE_STYLE_SCHEME
    where type 'a class_t = 'a GtkSourceStyleSchemeClass.t
    where type 'a style_class_t = 'a GtkSourceStyleClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDescription_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_description") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFilename_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_filename") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getId_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_id") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyle_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_style") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class_t = 'a GtkSourceStyleSchemeClass.t
    type 'a style_class_t = 'a GtkSourceStyleClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDescription self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDescription_ self
    fun getFilename self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getFilename_ self
    fun getId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getId_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getStyle self styleId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkSourceStyleClass.C.fromPtr false) getStyle_ (self & styleId)
    local
      open Property
    in
      val descriptionProp = {get = fn x => get "description" stringOpt x}
      val filenameProp = {get = fn x => get "filename" stringOpt x}
      val idProp =
        {
          get = fn x => get "id" stringOpt x,
          set = fn x => set "id" stringOpt x
        }
      val nameProp = {get = fn x => get "name" stringOpt x}
    end
  end
