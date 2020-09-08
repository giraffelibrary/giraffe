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
    val enabledProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val nameProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val parameterTypeProp : ('a class, unit -> GLib.VariantTypeRecord.t option, unit, GLib.VariantTypeRecord.t option -> unit) Property.t
    val stateProp : ('a class, unit -> GLib.VariantRecord.t option, GLib.VariantRecord.t option -> unit, GLib.VariantRecord.t option -> unit) Property.t
    val stateTypeProp : ('a class, unit -> GLib.VariantTypeRecord.t option, unit, unit) Property.t
  end
