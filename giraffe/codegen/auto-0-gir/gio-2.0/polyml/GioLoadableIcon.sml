structure GioLoadableIcon :>
  GIO_LOADABLE_ICON
    where type 'a class = 'a GioLoadableIconClass.class
    where type 'a cancellable_class = 'a GioCancellableClass.class
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_loadable_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val load_ =
        call (getSymbol "g_loadable_icon_load")
          (
            GioLoadableIconClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cOutRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioInputStreamClass.PolyML.cPtr
          )
      val loadFinish_ =
        call (getSymbol "g_loadable_icon_load_finish")
          (
            GioLoadableIconClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> Utf8.PolyML.cOutRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioInputStreamClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioLoadableIconClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun load self (size, cancellable) =
      let
        val type' & retVal =
          (
            GioLoadableIconClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GioCancellableClass.FFI.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && GioInputStreamClass.FFI.fromPtr true
          )
            load_
            (
              self
               & size
               & NONE
               & cancellable
               & []
            )
      in
        (retVal, type')
      end
    fun loadFinish self res =
      let
        val type' & retVal =
          (
            GioLoadableIconClass.FFI.withPtr
             &&&> GioAsyncResultClass.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.FFI.fromPtr 1 && GioInputStreamClass.FFI.fromPtr true
          )
            loadFinish_
            (
              self
               & res
               & NONE
               & []
            )
      in
        (retVal, type')
      end
  end
