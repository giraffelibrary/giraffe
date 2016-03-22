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
      val getType_ = call (load_sym libgio "g_loadable_icon_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val load_ =
        call (load_sym libgio "g_loadable_icon_load")
          (
            GioLoadableIconClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cOutRef
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioInputStreamClass.PolyML.cPtr
          )
      val loadFinish_ =
        call (load_sym libgio "g_loadable_icon_load_finish")
          (
            GioLoadableIconClass.PolyML.cPtr
             &&> GioAsyncResultClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioInputStreamClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioLoadableIconClass.class
    type 'a cancellable_class = 'a GioCancellableClass.class
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun load self size cancellable =
      let
        val type' & retVal =
          (
            GioLoadableIconClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> Utf8.C.withRefOptPtr
             &&&> GioCancellableClass.C.withOptPtr
             &&&> GLibErrorRecord.handleError
             ---> Utf8.C.fromPtr true && GioInputStreamClass.C.fromPtr true
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
    fun loadFinish self res type' =
      (
        GioLoadableIconClass.C.withPtr
         &&&> GioAsyncResultClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GioInputStreamClass.C.fromPtr true
      )
        loadFinish_
        (
          self
           & res
           & type'
           & []
        )
  end
