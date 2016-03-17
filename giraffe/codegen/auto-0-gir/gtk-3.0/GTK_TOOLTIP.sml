signature GTK_TOOLTIP =
  sig
    type 'a class
    type 'a widget_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val triggerTooltipQuery : 'a Gdk.DisplayClass.class -> unit
    val setCustom :
      'a class
       -> 'b widget_class option
       -> unit
    val setIcon :
      'a class
       -> 'b GdkPixbuf.PixbufClass.class option
       -> unit
    val setIconFromGicon :
      'a class
       -> 'b Gio.IconClass.class option
       -> LargeInt.int
       -> unit
    val setIconFromIconName :
      'a class
       -> string option
       -> LargeInt.int
       -> unit
    val setIconFromStock :
      'a class
       -> string option
       -> LargeInt.int
       -> unit
    val setMarkup :
      'a class
       -> string option
       -> unit
    val setText :
      'a class
       -> string option
       -> unit
    val setTipArea :
      'a class
       -> Gdk.RectangleRecord.t
       -> unit
  end
