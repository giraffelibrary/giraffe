signature GTK_SOURCE_COMPLETION_INFO =
  sig
    type 'a class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base Gtk.BuildableClass.class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getWidget : 'a class -> base Gtk.WidgetClass.class
    val moveToIter :
      'a class
       -> 'b Gtk.TextViewClass.class * Gtk.TextIterRecord.t option
       -> unit
    val setWidget :
      'a class
       -> 'b Gtk.WidgetClass.class option
       -> unit
    val beforeShowSig : (unit -> unit) -> 'a class Signal.signal
  end
