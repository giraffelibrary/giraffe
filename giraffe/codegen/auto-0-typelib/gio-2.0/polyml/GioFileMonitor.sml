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
      val cancel_ = call (load_sym libgio "g_file_monitor_cancel") (GioFileMonitorClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val emitEvent_ =
        call (load_sym libgio "g_file_monitor_emit_event")
          (
            GioFileMonitorClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GioFileMonitorEvent.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val isCancelled_ = call (load_sym libgio "g_file_monitor_is_cancelled") (GioFileMonitorClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setRateLimit_ = call (load_sym libgio "g_file_monitor_set_rate_limit") (GioFileMonitorClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GioFileMonitorClass.class
    type file_monitor_event_t = GioFileMonitorEvent.t
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun cancel self = (GioFileMonitorClass.C.withPtr ---> FFI.Bool.C.fromVal) cancel_ self
    fun emitEvent self child otherFile eventType =
      (
        GioFileMonitorClass.C.withPtr
         &&&> GioFileClass.C.withPtr
         &&&> GioFileClass.C.withPtr
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
    fun isCancelled self = (GioFileMonitorClass.C.withPtr ---> FFI.Bool.C.fromVal) isCancelled_ self
    fun setRateLimit self limitMsecs = (GioFileMonitorClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setRateLimit_ (self & limitMsecs)
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
