signature GTK_ACTION_GROUP =
  sig
    type 'a class_t
    type 'a actionclass_t
    type 'a widgetclass_t
    type actionentry_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val addAction :
      'a class_t
       -> 'b actionclass_t
       -> unit
    val addActions :
      'a class_t
       -> actionentry_t list
       -> unit
    val addActionWithAccel :
      'a class_t
       -> 'b actionclass_t
       -> string option
       -> unit
    val getAction :
      'a class_t
       -> string
       -> base actionclass_t
    val getName : 'a class_t -> string
    val getSensitive : 'a class_t -> bool
    val getVisible : 'a class_t -> bool
    val removeAction :
      'a class_t
       -> 'b actionclass_t
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
      (base actionclass_t
        -> base widgetclass_t
        -> unit)
       -> 'a class_t Signal.signal
    val disconnectProxySig :
      (base actionclass_t
        -> base widgetclass_t
        -> unit)
       -> 'a class_t Signal.signal
    val postActivateSig : (base actionclass_t -> unit) -> 'a class_t Signal.signal
    val preActivateSig : (base actionclass_t -> unit) -> 'a class_t Signal.signal
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val sensitiveProp : ('a class_t, bool, bool) Property.readwrite
    val visibleProp : ('a class_t, bool, bool) Property.readwrite
  end
