signature GIO_INITABLE =
  sig
    type 'a class
    type 'a cancellable_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val newv :
      GObject.Type.t
       * GObject.ParameterRecord.t vector
       * 'a cancellable_class option
       -> base GObject.ObjectClass.class
    val init :
      'a class
       -> 'b cancellable_class option
       -> unit
  end
