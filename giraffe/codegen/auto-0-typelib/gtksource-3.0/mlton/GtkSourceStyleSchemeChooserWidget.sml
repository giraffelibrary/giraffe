structure GtkSourceStyleSchemeChooserWidget :>
  GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET
    where type 'a class = 'a GtkSourceStyleSchemeChooserWidgetClass.class
    where type 'a style_scheme_chooser_class = 'a GtkSourceStyleSchemeChooserClass.class =
  struct
    val getType_ = _import "gtk_source_style_scheme_chooser_widget_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_style_scheme_chooser_widget_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    type 'a class = 'a GtkSourceStyleSchemeChooserWidgetClass.class
    type 'a style_scheme_chooser_class = 'a GtkSourceStyleSchemeChooserClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asStyleSchemeChooser self = (GObjectObjectClass.FFI.withPtr false ---> GtkSourceStyleSchemeChooserClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceStyleSchemeChooserWidgetClass.FFI.fromPtr false) new_ ()
  end
