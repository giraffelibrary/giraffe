structure GioFileMonitor :>
  GIO_FILE_MONITOR
    where type 'a class = 'a GioFileMonitorClass.class
    where type file_monitor_event_t = GioFileMonitorEvent.t
    where type 'a file_class = 'a GioFileClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_monitor_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val cancel_ = call (getSymbol "g_file_monitor_cancel") (GioFileMonitorClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val emitEvent_ =
        call (getSymbol "g_file_monitor_emit_event")
          (
            GioFileMonitorClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GioFileClass.PolyML.cPtr
             &&> GioFileMonitorEvent.PolyML.cVal
             --> cVoid
          )
      val isCancelled_ = call (getSymbol "g_file_monitor_is_cancelled") (GioFileMonitorClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setRateLimit_ = call (getSymbol "g_file_monitor_set_rate_limit") (GioFileMonitorClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GioFileMonitorClass.class
    type file_monitor_event_t = GioFileMonitorEvent.t
    type 'a file_class = 'a GioFileClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun cancel self = (GioFileMonitorClass.FFI.withPtr ---> GBool.FFI.fromVal) cancel_ self
    fun emitEvent
      self
      (
        child,
        otherFile,
        eventType
      ) =
      (
        GioFileMonitorClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         &&&> GioFileClass.FFI.withPtr
         &&&> GioFileMonitorEvent.FFI.withVal
         ---> I
      )
        emitEvent_
        (
          self
           & child
           & otherFile
           & eventType
        )
    fun isCancelled self = (GioFileMonitorClass.FFI.withPtr ---> GBool.FFI.fromVal) isCancelled_ self
    fun setRateLimit self limitMsecs = (GioFileMonitorClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setRateLimit_ (self & limitMsecs)
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
                f
                  (
                    file,
                    otherFile,
                    eventType
                  )
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
