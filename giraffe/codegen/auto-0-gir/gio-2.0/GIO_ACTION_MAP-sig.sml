signature GIO_ACTION_MAP =
  sig
    type 'a class
    type 'a action_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val addAction :
      'a class
       -> 'b action_class
       -> unit
    val lookupAction :
      'a class
       -> string
       -> base action_class
    val removeAction :
      'a class
       -> string
       -> unit
  end
