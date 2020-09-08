signature GTK_SOURCE_STYLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val apply :
      'a class
       -> 'b Gtk.TextTagClass.class
       -> unit
    val copy : 'a class -> base class
    val backgroundProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val backgroundSetProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val boldProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val boldSetProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val foregroundProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val foregroundSetProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val italicProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val italicSetProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val lineBackgroundProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val lineBackgroundSetProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val pangoUnderlineProp : ('a class, unit -> Pango.Underline.t, unit, Pango.Underline.t -> unit) Property.t
    val scaleProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val scaleSetProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val strikethroughProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val strikethroughSetProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val underlineProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val underlineColorProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val underlineColorSetProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val underlineSetProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
  end
