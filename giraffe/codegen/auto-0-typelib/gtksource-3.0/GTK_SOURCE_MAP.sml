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
    val fontDescProp :
      {
        get : 'a class -> Pango.FontDescriptionRecord.t option,
        set :
          Pango.FontDescriptionRecord.t option
           -> 'a class
           -> unit,
        new : Pango.FontDescriptionRecord.t option -> 'a class Property.t
      }
    val viewProp :
      {
        get : 'a class -> base view_class option,
        set :
          'b view_class option
           -> 'a class
           -> unit,
        new : 'b view_class option -> 'a class Property.t
      }
  end
