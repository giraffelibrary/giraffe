signature GTK_I_M_CONTEXT =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val deleteSurrounding :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val filterKeypress :
      'a class_t
       -> Gdk.EventKeyRecord.t
       -> bool
    val focusIn : 'a class_t -> unit
    val focusOut : 'a class_t -> unit
    val getPreeditString :
      'a class_t
       -> string
           * Pango.AttrListRecord.t
           * LargeInt.int
    val reset : 'a class_t -> unit
    val setClientWindow :
      'a class_t
       -> 'b Gdk.WindowClass.t option
       -> unit
    val setCursorLocation :
      'a class_t
       -> Gdk.RectangleRecord.t
       -> unit
    val setSurrounding :
      'a class_t
       -> string
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setUsePreedit :
      'a class_t
       -> bool
       -> unit
    val commitSig : (string -> unit) -> 'a class_t Signal.signal
    val deleteSurroundingSig :
      (LargeInt.int
        -> LargeInt.int
        -> bool)
       -> 'a class_t Signal.signal
    val preeditChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val preeditEndSig : (unit -> unit) -> 'a class_t Signal.signal
    val preeditStartSig : (unit -> unit) -> 'a class_t Signal.signal
    val retrieveSurroundingSig : (unit -> bool) -> 'a class_t Signal.signal
  end
