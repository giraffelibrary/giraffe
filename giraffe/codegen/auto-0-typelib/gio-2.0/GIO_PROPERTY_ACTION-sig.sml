signature GIO_PROPERTY_ACTION =
  sig
    type 'a class
    type 'a action_class
    type t = base class
    val asAction : 'a class -> base action_class
    val getType : unit -> GObject.Type.t
    val new :
      string
       * 'a GObject.ObjectClass.class
       * string
       -> base class
    val enabledProp : ('a class, unit -> bool, unit, unit) Property.t
    val invertBooleanProp : ('a class, unit -> bool, unit, bool -> unit) Property.t
    val nameProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val objectProp : ('a class, unit, unit, 'b GObject.ObjectClass.class option -> unit) Property.t
    val parameterTypeProp : ('a class, unit -> GLib.VariantTypeRecord.t option, unit, unit) Property.t
    val propertyNameProp : ('a class, unit, unit, string option -> unit) Property.t
    val stateProp : ('a class, unit -> GLib.VariantRecord.t option, unit, unit) Property.t
    val stateTypeProp : ('a class, unit -> GLib.VariantTypeRecord.t option, unit, unit) Property.t
  end
