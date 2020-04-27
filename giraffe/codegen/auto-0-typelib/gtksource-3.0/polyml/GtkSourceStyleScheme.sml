structure GtkSourceStyleScheme :>
  GTK_SOURCE_STYLE_SCHEME
    where type 'a class = 'a GtkSourceStyleSchemeClass.class
    where type 'a style_class = 'a GtkSourceStyleClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_style_scheme_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getAuthors_ = call (getSymbol "gtk_source_style_scheme_get_authors") (GtkSourceStyleSchemeClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutOptPtr)
      val getDescription_ = call (getSymbol "gtk_source_style_scheme_get_description") (GtkSourceStyleSchemeClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getFilename_ = call (getSymbol "gtk_source_style_scheme_get_filename") (GtkSourceStyleSchemeClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getId_ = call (getSymbol "gtk_source_style_scheme_get_id") (GtkSourceStyleSchemeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (getSymbol "gtk_source_style_scheme_get_name") (GtkSourceStyleSchemeClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getStyle_ = call (getSymbol "gtk_source_style_scheme_get_style") (GtkSourceStyleSchemeClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSourceStyleClass.PolyML.cOptPtr)
    end
    type 'a class = 'a GtkSourceStyleSchemeClass.class
    type 'a style_class = 'a GtkSourceStyleClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getAuthors self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8CPtrArray.FFI.fromOptPtr 0) getAuthors_ self
    fun getDescription self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getDescription_ self
    fun getFilename self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getFilename_ self
    fun getId self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getId_ self
    fun getName self = (GtkSourceStyleSchemeClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getStyle self styleId = (GtkSourceStyleSchemeClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSourceStyleClass.FFI.fromOptPtr false) getStyle_ (self & styleId)
    local
      open Property
    in
      val descriptionProp = {get = fn x => get "description" stringOpt x}
      val filenameProp = {get = fn x => get "filename" stringOpt x}
      val idProp =
        {
          get = fn x => get "id" stringOpt x,
          new = fn x => new "id" stringOpt x
        }
      val nameProp = {get = fn x => get "name" stringOpt x}
    end
  end
