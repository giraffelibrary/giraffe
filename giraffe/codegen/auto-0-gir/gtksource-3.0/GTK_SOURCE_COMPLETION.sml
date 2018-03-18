signature GTK_SOURCE_COMPLETION =
  sig
    type 'a class
    type 'a completion_info_class
    type 'a completion_provider_class
    type 'a completion_context_class
    type 'a view_class
    type t = base class
    val asBuildable : 'a class -> base Gtk.BuildableClass.class
    val getType : unit -> GObject.Type.t
    val addProvider :
      'a class
       -> 'b completion_provider_class
       -> unit
    val blockInteractive : 'a class -> unit
    val createContext :
      'a class
       -> Gtk.TextIterRecord.t option
       -> base completion_context_class
    val getInfoWindow : 'a class -> base completion_info_class
    val getView : 'a class -> base view_class option
    val hide : 'a class -> unit
    val moveWindow :
      'a class
       -> Gtk.TextIterRecord.t
       -> unit
    val removeProvider :
      'a class
       -> 'b completion_provider_class
       -> unit
    val unblockInteractive : 'a class -> unit
    val activateProposalSig : (unit -> unit) -> 'a class Signal.t
    val hideSig : (unit -> unit) -> 'a class Signal.t
    val moveCursorSig : (Gtk.ScrollStep.t * LargeInt.int -> unit) -> 'a class Signal.t
    val movePageSig : (Gtk.ScrollStep.t * LargeInt.int -> unit) -> 'a class Signal.t
    val populateContextSig : (base completion_context_class -> unit) -> 'a class Signal.t
    val showSig : (unit -> unit) -> 'a class Signal.t
    val acceleratorsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val autoCompleteDelayProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val proposalPageSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val providerPageSizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val rememberInfoVisibilityProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val selectOnShowProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showHeadersProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val showIconsProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val viewProp :
      {
        get : 'a class -> base view_class option,
        new : 'b view_class option -> 'a class Property.t
      }
  end
