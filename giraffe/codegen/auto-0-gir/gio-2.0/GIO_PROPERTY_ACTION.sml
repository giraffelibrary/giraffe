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
    val enabledProp : {get : 'a class -> bool}
    val invertBooleanProp :
      {
        get : 'a class -> bool,
        new : bool -> 'a class Property.t
      }
    val nameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val objectProp : {new : 'b GObject.ObjectClass.class option -> 'a class Property.t}
    val parameterTypeProp : {get : 'a class -> GLib.VariantTypeRecord.t option}
    val propertyNameProp : {new : string option -> 'a class Property.t}
    val stateProp : {get : 'a class -> GLib.VariantRecord.t option}
    val stateTypeProp : {get : 'a class -> GLib.VariantTypeRecord.t option}
  end
