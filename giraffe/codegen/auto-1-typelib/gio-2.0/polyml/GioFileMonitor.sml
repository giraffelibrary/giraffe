structure GioFileMonitor :>
  GIO_FILE_MONITOR
    where type 'a class_t = 'a GioFileMonitorClass.t
    where type filemonitorevent_t = GioFileMonitorEvent.t
    where type 'a fileclass_t = 'a GioFileClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_file_monitor_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val cancel_ = call (load_sym libgio "g_file_monitor_cancel") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val emitEvent_ =
        call (load_sym libgio "g_file_monitor_emit_event")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GioFileMonitorEvent.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val isCancelled_ = call (load_sym libgio "g_file_monitor_is_cancelled") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setRateLimit_ = call (load_sym libgio "g_file_monitor_set_rate_limit") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioFileMonitorClass.t
    type filemonitorevent_t = GioFileMonitorEvent.t
    type 'a fileclass_t = 'a GioFileClass.t
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
    fun setRateLimit self limitMsecs = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setRateLimit_ (self & limitMsecs)
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
