signature GTK_TOOLTIP =
  sig
    type 'a class_t
    type 'a widget_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val triggerTooltipQuery : 'a Gdk.DisplayClass.t -> unit
    val setCustom :
      'a class_t
       -> 'b widget_class_t option
       -> unit
    val setIcon :
      'a class_t
       -> 'b GdkPixbuf.PixbufClass.t option
       -> unit
    val setIconFromGicon :
      'a class_t
       -> 'b Gio.IconClass.t option
       -> LargeInt.int
       -> unit
    val setIconFromIconName :
      'a class_t
       -> string option
       -> LargeInt.int
       -> unit
    val setIconFromStock :
      'a class_t
       -> string option
       -> LargeInt.int
       -> unit
    val setMarkup :
      'a class_t
       -> string option
       -> unit
    val setText :
      'a class_t
       -> string option
       -> unit
    val setTipArea :
      'a class_t
       -> Gdk.RectangleRecord.t
       -> unit
  end
