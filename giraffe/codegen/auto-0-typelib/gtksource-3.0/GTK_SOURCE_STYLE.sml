signature GTK_SOURCE_STYLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val copy : 'a class -> base class
    val backgroundProp : ('a class, string option, string option) Property.readwrite
    val backgroundSetProp : ('a class, bool, bool) Property.readwrite
    val boldProp : ('a class, bool, bool) Property.readwrite
    val boldSetProp : ('a class, bool, bool) Property.readwrite
    val foregroundProp : ('a class, string option, string option) Property.readwrite
    val foregroundSetProp : ('a class, bool, bool) Property.readwrite
    val italicProp : ('a class, bool, bool) Property.readwrite
    val italicSetProp : ('a class, bool, bool) Property.readwrite
    val lineBackgroundProp : ('a class, string option, string option) Property.readwrite
    val lineBackgroundSetProp : ('a class, bool, bool) Property.readwrite
    val strikethroughProp : ('a class, bool, bool) Property.readwrite
    val strikethroughSetProp : ('a class, bool, bool) Property.readwrite
    val underlineProp : ('a class, bool, bool) Property.readwrite
    val underlineSetProp : ('a class, bool, bool) Property.readwrite
  end
