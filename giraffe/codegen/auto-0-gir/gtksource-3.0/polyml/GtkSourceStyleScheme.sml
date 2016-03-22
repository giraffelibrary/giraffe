structure GtkSourceStyleScheme :>
  GTK_SOURCE_STYLE_SCHEME
    where type 'a class = 'a GtkSourceStyleSchemeClass.class
    where type 'a style_class = 'a GtkSourceStyleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDescription_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_description") (GtkSourceStyleSchemeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFilename_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_filename") (GtkSourceStyleSchemeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getId_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_id") (GtkSourceStyleSchemeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_name") (GtkSourceStyleSchemeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyle_ = call (load_sym libgtksourceview "gtk_source_style_scheme_get_style") (GtkSourceStyleSchemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSourceStyleClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkSourceStyleSchemeClass.class
    type 'a style_class = 'a GtkSourceStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDescription self = (GtkSourceStyleSchemeClass.C.withPtr ---> Utf8.C.fromPtr false) getDescription_ self
    fun getFilename self = (GtkSourceStyleSchemeClass.C.withPtr ---> Utf8.C.fromPtr false) getFilename_ self
    fun getId self = (GtkSourceStyleSchemeClass.C.withPtr ---> Utf8.C.fromPtr false) getId_ self
    fun getName self = (GtkSourceStyleSchemeClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getStyle self styleId = (GtkSourceStyleSchemeClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkSourceStyleClass.C.fromPtr false) getStyle_ (self & styleId)
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
