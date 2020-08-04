structure GtkSourceStyleSchemeChooser :>
  GTK_SOURCE_STYLE_SCHEME_CHOOSER
    where type 'a class = 'a GtkSourceStyleSchemeChooserClass.class
    where type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class =
  struct
    val getType_ = _import "gtk_source_style_scheme_chooser_get_type" : unit -> GObjectType.FFI.val_;
    val getStyleScheme_ = _import "gtk_source_style_scheme_chooser_get_style_scheme" : GtkSourceStyleSchemeChooserClass.FFI.non_opt GtkSourceStyleSchemeChooserClass.FFI.p -> GtkSourceStyleSchemeClass.FFI.non_opt GtkSourceStyleSchemeClass.FFI.p;
    val setStyleScheme_ = fn x1 & x2 => (_import "gtk_source_style_scheme_chooser_set_style_scheme" : GtkSourceStyleSchemeChooserClass.FFI.non_opt GtkSourceStyleSchemeChooserClass.FFI.p * GtkSourceStyleSchemeClass.FFI.non_opt GtkSourceStyleSchemeClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceStyleSchemeChooserClass.class
    type 'a style_scheme_class = 'a GtkSourceStyleSchemeClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getStyleScheme self = (GtkSourceStyleSchemeChooserClass.FFI.withPtr false ---> GtkSourceStyleSchemeClass.FFI.fromPtr false) getStyleScheme_ self
    fun setStyleScheme self scheme = (GtkSourceStyleSchemeChooserClass.FFI.withPtr false &&&> GtkSourceStyleSchemeClass.FFI.withPtr false ---> I) setStyleScheme_ (self & scheme)
    local
      open Property
    in
      val styleSchemeProp =
        {
          get = fn x => get "style-scheme" GtkSourceStyleSchemeClass.tOpt x,
          set = fn x => set "style-scheme" GtkSourceStyleSchemeClass.tOpt x,
          new = fn x => new "style-scheme" GtkSourceStyleSchemeClass.tOpt x
        }
    end
  end
