structure GioDatagramBased :>
  GIO_DATAGRAM_BASED
    where type 'a class = 'a GioDatagramBasedClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_datagram_based_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val conditionCheck_ = call (getSymbol "g_datagram_based_condition_check") (GioDatagramBasedClass.PolyML.cPtr &&> GLibIOCondition.PolyML.cVal --> GLibIOCondition.PolyML.cVal)
      val conditionWait_ =
        call (getSymbol "g_datagram_based_condition_wait")
          (
            GioDatagramBasedClass.PolyML.cPtr
             &&> GLibIOCondition.PolyML.cVal
             &&> GInt64.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val createSource_ =
        call (getSymbol "g_datagram_based_create_source")
          (
            GioDatagramBasedClass.PolyML.cPtr
             &&> GLibIOCondition.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             --> GLibSourceRecord.PolyML.cPtr
          )
    end
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
