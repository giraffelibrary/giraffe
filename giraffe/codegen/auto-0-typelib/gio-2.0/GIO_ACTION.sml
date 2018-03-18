signature GIO_ACTION =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val nameIsValid : string -> bool
    val parseDetailedName : string -> string * GLib.VariantRecord.t
    val printDetailedName : string * GLib.VariantRecord.t option -> string
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
    val getParameterType : 'a class -> GLib.VariantTypeRecord.t option
    val getState : 'a class -> GLib.VariantRecord.t
    val getStateHint : 'a class -> GLib.VariantRecord.t option
    val getStateType : 'a class -> GLib.VariantTypeRecord.t option
    val enabledProp : {get : 'a class -> bool}
    val nameProp : {get : 'a class -> string option}
    val parameterTypeProp : {get : 'a class -> GLib.VariantTypeRecord.t option}
    val stateProp : {get : 'a class -> GLib.VariantRecord.t option}
    val stateTypeProp : {get : 'a class -> GLib.VariantTypeRecord.t option}
  end
