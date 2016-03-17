signature GIO_INITABLE =
  sig
    type 'a class
    type 'a cancellable_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val init :
      'a class
       -> 'b cancellable_class option
       -> bool
  end
