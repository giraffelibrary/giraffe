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
    val enabledProp : ('a class, bool) Property.readonly
    val invertBooleanProp : ('a class, bool, bool) Property.readwrite
    val nameProp : ('a class, string option, string option) Property.readwrite
    val objectProp : ('a class, 'b GObject.ObjectClass.class option) Property.writeonly
    val parameterTypeProp : ('a class, GLib.VariantTypeRecord.t option) Property.readonly
    val propertyNameProp : ('a class, string option) Property.writeonly
    val stateProp : ('a class, GLib.VariantRecord.t option) Property.readonly
    val stateTypeProp : ('a class, GLib.VariantTypeRecord.t option) Property.readonly
  end
