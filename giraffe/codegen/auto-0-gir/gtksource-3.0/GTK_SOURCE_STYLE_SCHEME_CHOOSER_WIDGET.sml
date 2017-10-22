signature GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET =
  sig
    type 'a class
    type 'a style_scheme_chooser_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base Gtk.BuildableClass.class
    val asStyleSchemeChooser : 'a class -> base style_scheme_chooser_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
  end
