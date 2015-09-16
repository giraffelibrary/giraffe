signature GTK_ACTION_GROUP =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type action_entry_t
    type 'a widget_class_t
    type 'a action_class_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val addAction :
      'a class_t
       -> 'b action_class_t
       -> unit
    val addActions :
      'a class_t
       -> action_entry_t list
       -> unit
    val addActionWithAccel :
      'a class_t
       -> 'b action_class_t
       -> string option
       -> unit
    val getAction :
      'a class_t
       -> string
       -> base action_class_t
    val getName : 'a class_t -> string
    val getSensitive : 'a class_t -> bool
    val getVisible : 'a class_t -> bool
    val removeAction :
      'a class_t
       -> 'b action_class_t
       -> unit
    val setSensitive :
      'a class_t
       -> bool
       -> unit
    val setTranslationDomain :
      'a class_t
       -> string option
       -> unit
    val setVisible :
      'a class_t
       -> bool
       -> unit
    val translateString :
      'a class_t
       -> string
       -> string
    val connectProxySig :
      (base action_class_t
        -> base widget_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val disconnectProxySig :
      (base action_class_t
        -> base widget_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val postActivateSig : (base action_class_t -> unit) -> 'a class_t Signal.signal
    val preActivateSig : (base action_class_t -> unit) -> 'a class_t Signal.signal
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val sensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val visibleProp : ('a class_t, bool, bool) Property.readwrite
  end
