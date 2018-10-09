signature GIO_ASYNC_RESULT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getSourceObject : 'a class -> base GObject.ObjectClass.class
    val legacyPropagateError : 'a class -> unit
  end
