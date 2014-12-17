signature GTK_SOURCE_COMPLETION_INFO =
  sig
    type 'a class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base Gtk.BuildableClass.t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getWidget : 'a class_t -> base Gtk.WidgetClass.t
    val moveToIter :
      'a class_t
       -> 'b Gtk.TextViewClass.t
       -> Gtk.TextIterRecord.t option
       -> unit
    val setWidget :
      'a class_t
       -> 'b Gtk.WidgetClass.t option
       -> unit
    val beforeShowSig : (unit -> unit) -> 'a class_t Signal.signal
  end
