structure GtkSourceStyleSchemeChooser :>
  GTK_SOURCE_STYLE_SCHEME_CHOOSER
    where type 'a class = 'a GtkSourceStyleSchemeChooserClass.class
    where type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_style_scheme_chooser_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getStyleScheme_ = call (getSymbol "gtk_source_style_scheme_chooser_get_style_scheme") (GtkSourceStyleSchemeChooserClass.PolyML.cPtr --> GtkSourceStyleSchemeClass.PolyML.cPtr)
      val setStyleScheme_ = call (getSymbol "gtk_source_style_scheme_chooser_set_style_scheme") (GtkSourceStyleSchemeChooserClass.PolyML.cPtr &&> GtkSourceStyleSchemeClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkSourceStyleSchemeChooserClass.class
    type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getStyleScheme self = (GtkSourceStyleSchemeChooserClass.FFI.withPtr ---> GtkSourceStyleSchemeClass.FFI.fromPtr false) getStyleScheme_ self
    fun setStyleScheme self scheme = (GtkSourceStyleSchemeChooserClass.FFI.withPtr &&&> GtkSourceStyleSchemeClass.FFI.withPtr ---> I) setStyleScheme_ (self & scheme)
    local
      open Property
    in
      val styleSchemeProp =
        {
          get = fn x => get "style-scheme" GtkSourceStyleSchemeClass.tOpt x,
          set = fn x => set "style-scheme" GtkSourceStyleSchemeClass.tOpt x
        }
    end
  end
