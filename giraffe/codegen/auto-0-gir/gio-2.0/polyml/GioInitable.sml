structure GioInitable :>
  GIO_INITABLE
    where type 'a class = 'a GioInitableClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class =
  struct
    structure GObjectParameterRecordCVectorNType =
      CValueCVectorNType(
        structure CElemType = GObjectParameterRecord.C.ValueType
        structure ElemSequence = CValueVectorSequence(GObjectParameterRecord.C.ValueType)
      )
    structure GObjectParameterRecordCVectorN = CVectorN(GObjectParameterRecordCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_initable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newv_ =
        call (getSymbol "g_initable_newv")
          (
            GObjectType.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GObjectParameterRecordCVectorN.PolyML.cInPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val init_ =
        call (getSymbol "g_initable_init")
          (
            GioInitableClass.PolyML.cPtr
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
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
             &&&> GUInt.FFI.withVal
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
