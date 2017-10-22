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
    val enabledProp : ('a class, bool, bool) Property.readwrite
    val nameProp : ('a class, string option, string option) Property.readwrite
    val parameterTypeProp : ('a class, GLib.VariantTypeRecord.t option, GLib.VariantTypeRecord.t option) Property.readwrite
    val stateProp : ('a class, GLib.VariantRecord.t option, GLib.VariantRecord.t option) Property.readwrite
    val stateTypeProp : ('a class, GLib.VariantTypeRecord.t option) Property.readonly
  end
