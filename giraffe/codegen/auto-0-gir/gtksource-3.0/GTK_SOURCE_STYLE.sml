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
    val backgroundProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val backgroundSetProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val boldProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val boldSetProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val foregroundProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val foregroundSetProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val italicProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val italicSetProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val lineBackgroundProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val lineBackgroundSetProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val pangoUnderlineProp :
      {
        get : 'a class -> Pango.Underline.t,
        new : Pango.Underline.t -> 'a class Property.t
      }
    val scaleProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val scaleSetProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val strikethroughProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val strikethroughSetProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val underlineProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val underlineColorProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val underlineColorSetProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val underlineSetProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
  end
