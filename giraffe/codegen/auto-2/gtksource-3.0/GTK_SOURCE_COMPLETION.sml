signature GTK_SOURCE_COMPLETION =
  sig
    type 'a class_t
    type 'a viewclass_t
    type 'a completioncontextclass_t
    type 'a completionproviderclass_t
    type 'a completioninfoclass_t
    val getType : unit -> GObject.Type.t
    val addProvider :
      'a class_t
       -> 'b completionproviderclass_t
       -> bool
    val blockInteractive : 'a class_t -> unit
    val createContext :
      'a class_t
       -> Gtk.TextIterRecord.t option
       -> base completioncontextclass_t
    val getInfoWindow : 'a class_t -> base completioninfoclass_t
    val getView : 'a class_t -> base viewclass_t
    val hide : 'a class_t -> unit
    val moveWindow :
      'a class_t
       -> Gtk.TextIterRecord.t
       -> unit
    val removeProvider :
      'a class_t
       -> 'b completionproviderclass_t
       -> bool
    val unblockInteractive : 'a class_t -> unit
    val activateProposalSig : (unit -> unit) -> 'a class_t Signal.signal
    val hideSig : (unit -> unit) -> 'a class_t Signal.signal
    val moveCursorSig :
      (Gtk.ScrollStep.t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val movePageSig :
      (Gtk.ScrollStep.t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val populateContextSig : (base completioncontextclass_t -> unit) -> 'a class_t Signal.signal
    val showSig : (unit -> unit) -> 'a class_t Signal.signal
    val acceleratorsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val autoCompleteDelayProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val proposalPageSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val providerPageSizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val rememberInfoVisibilityProp : ('a class_t, bool, bool) Property.readwrite
    val selectOnShowProp : ('a class_t, bool, bool) Property.readwrite
    val showHeadersProp : ('a class_t, bool, bool) Property.readwrite
    val showIconsProp : ('a class_t, bool, bool) Property.readwrite
    val viewProp : ('a class_t, base viewclass_t option, 'b viewclass_t option) Property.readwrite
  end
