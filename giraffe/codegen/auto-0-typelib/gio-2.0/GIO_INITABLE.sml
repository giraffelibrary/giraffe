signature GIO_INITABLE =
  sig
    type 'a class_t
    type 'a cancellableclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val init :
      'a class_t
       -> 'b cancellableclass_t option
       -> bool
  end
