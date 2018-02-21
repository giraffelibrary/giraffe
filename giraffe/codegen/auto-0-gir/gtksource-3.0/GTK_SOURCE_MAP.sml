signature GTK_SOURCE_MAP =
  sig
    type 'a class
    type 'a view_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base Gtk.BuildableClass.class
    val asScrollable : 'a class -> base Gtk.ScrollableClass.class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getView : 'a class -> base view_class option
    val setView :
      'a class
       -> 'b view_class
       -> unit
    val fontDescProp : ('a class, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val viewProp : ('a class, base view_class option, 'b view_class option) Property.readwrite
  end
