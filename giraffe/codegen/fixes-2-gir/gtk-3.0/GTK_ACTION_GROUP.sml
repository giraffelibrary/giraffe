signature GTK_ACTION_GROUP =
  sig
    type 'a class
    type 'a buildable_class
    type action_entry_t
    type 'a widget_class
    type 'a action_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : string -> base class
    val addAction :
      'a class
       -> 'b action_class
       -> unit
    val addActions :
      'a class
       -> action_entry_t list
       -> unit
    val addActionWithAccel :
      'a class
       -> 'b action_class
       -> string option
       -> unit
    val getAction :
      'a class
       -> string
       -> base action_class
    val getName : 'a class -> string
    val getSensitive : 'a class -> bool
    val getVisible : 'a class -> bool
    val removeAction :
      'a class
       -> 'b action_class
       -> unit
    val setSensitive :
      'a class
       -> bool
       -> unit
    val setTranslationDomain :
      'a class
       -> string option
       -> unit
    val setVisible :
      'a class
       -> bool
       -> unit
    val translateString :
      'a class
       -> string
       -> string
    val connectProxySig :
      (base action_class
        -> base widget_class
        -> unit)
       -> 'a class Signal.signal
    val disconnectProxySig :
      (base action_class
        -> base widget_class
        -> unit)
       -> 'a class Signal.signal
    val postActivateSig : (base action_class -> unit) -> 'a class Signal.signal
    val preActivateSig : (base action_class -> unit) -> 'a class Signal.signal
    val nameProp : ('a class, string option, string option) Property.readwrite
    val sensitiveProp : ('a class, bool, bool) Property.readwrite
    val visibleProp : ('a class, bool, bool) Property.readwrite
  end
