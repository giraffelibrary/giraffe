structure GioLoadableIcon :>
  GIO_LOADABLE_ICON
    where type 'a class_t = 'a GioLoadableIconClass.t
    where type 'a cancellable_class_t = 'a GioCancellableClass.t
    where type 'a input_stream_class_t = 'a GioInputStreamClass.t
    where type 'a async_result_class_t = 'a GioAsyncResultClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_loadable_icon_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val load_ =
        call (load_sym libgio "g_loadable_icon_load")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> Utf8.PolyML.OUTREF
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val loadFinish_ =
        call (load_sym libgio "g_loadable_icon_load_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
    end
    type 'a class_t = 'a GioLoadableIconClass.t
    type 'a cancellable_class_t = 'a GioCancellableClass.t
    type 'a input_stream_class_t = 'a GioInputStreamClass.t
    type 'a async_result_class_t = 'a GioAsyncResultClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun load self size cancellable =
      let
        val type' & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> Utf8.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.C.handleError
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
