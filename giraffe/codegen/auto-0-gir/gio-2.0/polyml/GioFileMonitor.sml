structure GioFileMonitor :>
  GIO_FILE_MONITOR
    where type 'a class = 'a GioFileMonitorClass.class
    where type file_monitor_event_t = GioFileMonitorEvent.t
    where type 'a file_class = 'a GioFileClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_monitor_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val cancel_ = call (load_sym libgio "g_file_monitor_cancel") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val emitEvent_ =
        call (load_sym libgio "g_file_monitor_emit_event")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GioFileMonitorEvent.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val isCancelled_ = call (load_sym libgio "g_file_monitor_is_cancelled") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setRateLimit_ = call (load_sym libgio "g_file_monitor_set_rate_limit") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioFileMonitorClass.class
    type file_monitor_event_t = GioFileMonitorEvent.t
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun cancel self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) cancel_ self
    fun emitEvent self child otherFile eventType =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GioFileMonitorEvent.C.withVal
         ---> I
      )
        emitEvent_
        (
          self
           & child
           & otherFile
           & eventType
        )
    fun isCancelled self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isCancelled_ self
    fun setRateLimit self limitMsecs = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setRateLimit_ (self & limitMsecs)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f =
        signal "changed"
          (
            get 0w1 GioFileClass.t
             &&&> get 0w2 GioFileClass.t
             &&&> get 0w3 GioFileMonitorEvent.t
             ---> ret_void
          )
          (
            fn
              file
               & otherFile
               & eventType =>
                f file otherFile eventType
          )
    end
    local
      open Property
    in
      val cancelledProp = {get = fn x => get "cancelled" boolean x}
      val rateLimitProp =
        {
          get = fn x => get "rate-limit" int x,
          set = fn x => set "rate-limit" int x
        }
    end
  end
