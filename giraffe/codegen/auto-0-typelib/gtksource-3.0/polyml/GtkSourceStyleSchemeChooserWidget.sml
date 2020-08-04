structure GtkSourceStyleSchemeChooserWidget :>
  GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET
    where type 'a class = 'a GtkSourceStyleSchemeChooserWidgetClass.class
    where type 'a style_scheme_chooser_class = 'a GtkSourceStyleSchemeChooserClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_source_style_scheme_chooser_widget_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_source_style_scheme_chooser_widget_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkSourceStyleSchemeChooserWidgetClass.class
    type 'a style_scheme_chooser_class = 'a GtkSourceStyleSchemeChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asStyleSchemeChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkSourceStyleSchemeChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeChooserWidgetClass.FFI.fromPtr false) new_ ()
  end
