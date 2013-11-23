signature CHILD_SIGNAL =
  sig
    type 'a widgetclass_t

    val connect :
      'a widgetclass_t
       -> 'b GObjectObjectClass.t
       -> ('func -> 'b GObjectObjectClass.t Signal.signal)
       -> 'func
       -> unit
    val connectAfter :
      'a widgetclass_t
       -> 'b GObjectObjectClass.t
       -> ('func -> 'b GObjectObjectClass.t Signal.signal)
       -> 'func
       -> unit
  end
