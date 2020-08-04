structure GioDatagramBased :>
  GIO_DATAGRAM_BASED
    where type 'a class = 'a GioDatagramBasedClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    val getType_ = _import "g_datagram_based_get_type" : unit -> GObjectType.FFI.val_;
    val conditionCheck_ = fn x1 & x2 => (_import "g_datagram_based_condition_check" : GioDatagramBasedClass.FFI.non_opt GioDatagramBasedClass.FFI.p * GLibIOCondition.FFI.val_ -> GLibIOCondition.FFI.val_;) (x1, x2)
    val conditionWait_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "g_datagram_based_condition_wait" :
              GioDatagramBasedClass.FFI.non_opt GioDatagramBasedClass.FFI.p
               * GLibIOCondition.FFI.val_
               * GInt64.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val createSource_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_datagram_based_create_source" :
              GioDatagramBasedClass.FFI.non_opt GioDatagramBasedClass.FFI.p
               * GLibIOCondition.FFI.val_
               * GioCancellableClass.FFI.opt GioCancellableClass.FFI.p
               -> GLibSourceRecord.FFI.non_opt GLibSourceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDatagramBasedClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun conditionCheck self condition = (GioDatagramBasedClass.FFI.withPtr false &&&> GLibIOCondition.FFI.withVal ---> GLibIOCondition.FFI.fromVal) conditionCheck_ (self & condition)
    fun conditionWait
      self
      (
        condition,
        timeout,
        cancellable
      ) =
      (
        GioDatagramBasedClass.FFI.withPtr false
         &&&> GLibIOCondition.FFI.withVal
         &&&> GInt64.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        conditionWait_
        (
          self
           & condition
           & timeout
           & cancellable
           & []
        )
    fun createSource self (condition, cancellable) =
      (
        GioDatagramBasedClass.FFI.withPtr false
         &&&> GLibIOCondition.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         ---> GLibSourceRecord.FFI.fromPtr true
      )
        createSource_
        (
          self
           & condition
           & cancellable
        )
  end
