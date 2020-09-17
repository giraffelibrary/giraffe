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
    fun getAuthors self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromOptPtr 0) getAuthors_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getDescription self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getDescription_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getFilename self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getFilename_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getId self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getId_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getName self = (GtkSourceStyleSchemeClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GtkSourceStyleSchemeClass.FFI.touchPtr self
    fun getStyle self styleId = (GtkSourceStyleSchemeClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkSourceStyleClass.FFI.fromOptPtr false) getStyle_ (self & styleId) before GtkSourceStyleSchemeClass.FFI.touchPtr self before Utf8.FFI.touchPtr styleId
    local
      open ValueAccessor
    in
      val descriptionProp =
        {
          name = "description",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val filenameProp =
        {
          name = "filename",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
      val idProp =
        {
          name = "id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
