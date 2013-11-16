signature ATK_DOCUMENT =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getAttributeValue :
      'a class_t
       -> string
       -> string
    val getDocumentType : 'a class_t -> string
    val getLocale : 'a class_t -> string
    val setAttributeValue :
      'a class_t
       -> string
       -> string
       -> bool
    val loadCompleteSig : (unit -> unit) -> 'a class_t Signal.signal
    val loadStoppedSig : (unit -> unit) -> 'a class_t Signal.signal
    val reloadSig : (unit -> unit) -> 'a class_t Signal.signal
  end
