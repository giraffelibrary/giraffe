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
    fun getStyleScheme self = (GtkSourceStyleSchemeChooserClass.FFI.withPtr false ---> GtkSourceStyleSchemeClass.FFI.fromPtr false) getStyleScheme_ self
    fun setStyleScheme self scheme = (GtkSourceStyleSchemeChooserClass.FFI.withPtr false &&&> GtkSourceStyleSchemeClass.FFI.withPtr false ---> I) setStyleScheme_ (self & scheme)
    local
      open ValueAccessor
    in
      val styleSchemeProp =
        {
          name = "style-scheme",
          gtype = fn () => C.gtype GtkSourceStyleSchemeClass.tOpt (),
          get = fn x => fn () => C.get GtkSourceStyleSchemeClass.tOpt x,
          set = fn x => C.set GtkSourceStyleSchemeClass.tOpt x,
          init = fn x => C.set GtkSourceStyleSchemeClass.tOpt x
        }
    end
  end
