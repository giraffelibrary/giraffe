signature GIO_ACTION_GROUP =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val actionAdded :
      'a class_t
       -> string
       -> unit
    val actionEnabledChanged :
      'a class_t
       -> string
       -> bool
       -> unit
    val actionRemoved :
      'a class_t
       -> string
       -> unit
    val actionStateChanged :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
       -> unit
    val activateAction :
      'a class_t
       -> string
       -> GLib.VariantRecord.t option
       -> unit
    val changeActionState :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
       -> unit
    val getActionEnabled :
      'a class_t
       -> string
       -> bool
    val getActionParameterType :
      'a class_t
       -> string
       -> GLib.VariantTypeRecord.t
    val getActionState :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
    val getActionStateHint :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
    val getActionStateType :
      'a class_t
       -> string
       -> GLib.VariantTypeRecord.t
    val hasAction :
      'a class_t
       -> string
       -> bool
    val actionAddedSig : (string -> unit) -> 'a class_t Signal.signal
    val actionEnabledChangedSig :
      (string
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val actionRemovedSig : (string -> unit) -> 'a class_t Signal.signal
    val actionStateChangedSig :
      (string
        -> GLib.VariantRecord.t
        -> unit)
       -> 'a class_t Signal.signal
  end
