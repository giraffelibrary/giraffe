signature GIO_PERMISSION =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val acquire :
      'a class
       -> 'b cancellable_class option
       -> unit
    val acquireFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val getAllowed : 'a class -> bool
    val getCanAcquire : 'a class -> bool
    val getCanRelease : 'a class -> bool
    val implUpdate :
      'a class
       -> bool
           * bool
           * bool
       -> unit
    val release :
      'a class
       -> 'b cancellable_class option
       -> unit
    val releaseFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val allowedProp : ('a class, unit -> bool, unit, unit) Property.t
    val canAcquireProp : ('a class, unit -> bool, unit, unit) Property.t
    val canReleaseProp : ('a class, unit -> bool, unit, unit) Property.t
  end
