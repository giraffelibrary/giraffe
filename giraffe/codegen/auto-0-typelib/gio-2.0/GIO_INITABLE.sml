signature GIO_INITABLE =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val init :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
  end
