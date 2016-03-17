signature GIO_ACTION =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val activate :
      'a class
       -> GLib.VariantRecord.t option
       -> unit
    val changeState :
      'a class
       -> GLib.VariantRecord.t
       -> unit
    val getEnabled : 'a class -> bool
    val getName : 'a class -> string
    val getParameterType : 'a class -> GLib.VariantTypeRecord.t
    val getState : 'a class -> GLib.VariantRecord.t
    val getStateHint : 'a class -> GLib.VariantRecord.t
    val getStateType : 'a class -> GLib.VariantTypeRecord.t
    val enabledProp : ('a class, bool) Property.readonly
    val nameProp : ('a class, string option) Property.readonly
    val parameterTypeProp : ('a class, GLib.VariantTypeRecord.t option) Property.readonly
    val stateProp : ('a class, GLib.VariantRecord.t option) Property.readonly
    val stateTypeProp : ('a class, GLib.VariantTypeRecord.t option) Property.readonly
  end
