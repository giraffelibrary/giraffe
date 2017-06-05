signature GIO_ACTION_GROUP =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val actionAdded :
      'a class
       -> string
       -> unit
    val actionEnabledChanged :
      'a class
       -> string
       -> bool
       -> unit
    val actionRemoved :
      'a class
       -> string
       -> unit
    val actionStateChanged :
      'a class
       -> string
       -> GLib.VariantRecord.t
       -> unit
    val activateAction :
      'a class
       -> string
       -> GLib.VariantRecord.t option
       -> unit
    val changeActionState :
      'a class
       -> string
       -> GLib.VariantRecord.t
       -> unit
    val getActionEnabled :
      'a class
       -> string
       -> bool
    val getActionParameterType :
      'a class
       -> string
       -> GLib.VariantTypeRecord.t
    val getActionState :
      'a class
       -> string
       -> GLib.VariantRecord.t
    val getActionStateHint :
      'a class
       -> string
       -> GLib.VariantRecord.t
    val getActionStateType :
      'a class
       -> string
       -> GLib.VariantTypeRecord.t
    val hasAction :
      'a class
       -> string
       -> bool
    val listActions : 'a class -> string list
    val actionAddedSig : (string -> unit) -> 'a class Signal.signal
    val actionEnabledChangedSig :
      (string
        -> bool
        -> unit)
       -> 'a class Signal.signal
    val actionRemovedSig : (string -> unit) -> 'a class Signal.signal
    val actionStateChangedSig :
      (string
        -> GLib.VariantRecord.t
        -> unit)
       -> 'a class Signal.signal
  end
