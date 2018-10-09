signature GIO_SIMPLE_ACTION =
  sig
    type 'a class
    type 'a action_class
    type t = base class
    val asAction : 'a class -> base action_class
    val getType : unit -> GObject.Type.t
    val new : string * GLib.VariantTypeRecord.t option -> base class
    val newStateful :
      string
       * GLib.VariantTypeRecord.t option
       * GLib.VariantRecord.t
       -> base class
    val setEnabled :
      'a class
       -> bool
       -> unit
    val setState :
      'a class
       -> GLib.VariantRecord.t
       -> unit
    val setStateHint :
      'a class
       -> GLib.VariantRecord.t option
       -> unit
    val activateSig : (GLib.VariantRecord.t option -> unit) -> 'a class Signal.t
    val changeStateSig : (GLib.VariantRecord.t option -> unit) -> 'a class Signal.t
    val enabledProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val nameProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class Property.t
      }
    val parameterTypeProp :
      {
        get : 'a class -> GLib.VariantTypeRecord.t option,
        new : GLib.VariantTypeRecord.t option -> 'a class Property.t
      }
    val stateProp :
      {
        get : 'a class -> GLib.VariantRecord.t option,
        set :
          GLib.VariantRecord.t option
           -> 'a class
           -> unit,
        new : GLib.VariantRecord.t option -> 'a class Property.t
      }
    val stateTypeProp : {get : 'a class -> GLib.VariantTypeRecord.t option}
  end
