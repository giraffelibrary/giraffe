signature GTK_I_M_CONTEXT =
  sig
    type 'a class
    type input_hints_t
    type input_purpose_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val deleteSurrounding :
      'a class
       -> LargeInt.int * LargeInt.int
       -> bool
    val filterKeypress :
      'a class
       -> Gdk.EventKeyRecord.t
       -> bool
    val focusIn : 'a class -> unit
    val focusOut : 'a class -> unit
    val getPreeditString :
      'a class
       -> string
           * Pango.AttrListRecord.t
           * LargeInt.int
    val getSurrounding : 'a class -> (string * LargeInt.int) option
    val reset : 'a class -> unit
    val setClientWindow :
      'a class
       -> 'b Gdk.WindowClass.class option
       -> unit
    val setCursorLocation :
      'a class
       -> Gdk.RectangleRecord.t
       -> unit
    val setSurrounding :
      'a class
       -> string
           * LargeInt.int
           * LargeInt.int
       -> unit
    val setUsePreedit :
      'a class
       -> bool
       -> unit
    val commitSig : (string -> unit) -> 'a class Signal.t
    val deleteSurroundingSig : (LargeInt.int * LargeInt.int -> bool) -> 'a class Signal.t
    val preeditChangedSig : (unit -> unit) -> 'a class Signal.t
    val preeditEndSig : (unit -> unit) -> 'a class Signal.t
    val preeditStartSig : (unit -> unit) -> 'a class Signal.t
    val retrieveSurroundingSig : (unit -> bool) -> 'a class Signal.t
    val inputHintsProp : ('a class, unit -> input_hints_t, input_hints_t -> unit, input_hints_t -> unit) Property.t
    val inputPurposeProp : ('a class, unit -> input_purpose_t, input_purpose_t -> unit, input_purpose_t -> unit) Property.t
  end
