signature GTK_SOURCE_STYLE =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val copy : 'a class_t -> base class_t
    val backgroundProp : ('a class_t, string option, string option) Property.readwrite
    val backgroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val boldProp : ('a class_t, bool, bool) Property.readwrite
    val boldSetProp : ('a class_t, bool, bool) Property.readwrite
    val foregroundProp : ('a class_t, string option, string option) Property.readwrite
    val foregroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val italicProp : ('a class_t, bool, bool) Property.readwrite
    val italicSetProp : ('a class_t, bool, bool) Property.readwrite
    val lineBackgroundProp : ('a class_t, string option, string option) Property.readwrite
    val lineBackgroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val strikethroughProp : ('a class_t, bool, bool) Property.readwrite
    val strikethroughSetProp : ('a class_t, bool, bool) Property.readwrite
    val underlineProp : ('a class_t, bool, bool) Property.readwrite
    val underlineSetProp : ('a class_t, bool, bool) Property.readwrite
  end
