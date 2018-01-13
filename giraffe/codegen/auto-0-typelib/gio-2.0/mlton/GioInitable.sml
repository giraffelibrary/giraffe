structure GioInitable :>
  GIO_INITABLE
    where type 'a class = 'a GioInitableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    structure GObjectParameterRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GObjectParameterRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GObjectParameterRecordCVectorN = CVectorN(GObjectParameterRecordCVectorNType)
    val getType_ = _import "g_initable_get_type" : unit -> GObjectType.FFI.val_;
    val newv_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_initable_newv" :
              GObjectType.FFI.val_
               * GUInt32.FFI.val_
               * GObjectParameterRecordCVectorN.MLton.p1
               * GObjectParameterRecordCVectorN.FFI.notnull GObjectParameterRecordCVectorN.MLton.p2
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val init_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_initable_init" :
              GioInitableClass.FFI.notnull GioInitableClass.FFI.p
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioInitableClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newv
      (
        objectType,
        parameters,
        cancellable
      ) =
      let
        val nParameters = LargeInt.fromInt (GObjectParameterRecordCVectorN.length parameters)
        val retVal =
          (
            GObjectType.FFI.withVal
             &&&> GUInt32.FFI.withVal
             &&&> GObjectParameterRecordCVectorN.FFI.withPtr
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> GObjectObjectClass.FFI.fromPtr true
          )
            newv_
            (
              objectType
               & nParameters
               & parameters
               & cancellable
               & []
            )
      in
        retVal
      end
    fun init self cancellable =
      (
        GioInitableClass.FFI.withPtr
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        init_
        (
          self
           & cancellable
           & []
        )
  end
