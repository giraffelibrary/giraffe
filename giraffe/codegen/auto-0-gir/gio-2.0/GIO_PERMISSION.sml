signature GIO_PERMISSION =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val acquire :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val acquireFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val getAllowed : 'a class_t -> bool
    val getCanAcquire : 'a class_t -> bool
    val getCanRelease : 'a class_t -> bool
    val implUpdate :
      'a class_t
       -> bool
       -> bool
       -> bool
       -> unit
    val release :
      'a class_t
       -> 'b cancellable_class_t option
       -> bool
    val releaseFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val allowedProp : ('a class_t, bool) Property.readonly
    val canAcquireProp : ('a class_t, bool) Property.readonly
    val canReleaseProp : ('a class_t, bool) Property.readonly
  end
