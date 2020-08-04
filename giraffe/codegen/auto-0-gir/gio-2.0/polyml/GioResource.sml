structure GioResource :>
  GIO_RESOURCE
    where type t = GioResourceRecord.t
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type resource_lookup_flags_t = GioResourceLookupFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_resource_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newFromData_ = call (getSymbol "g_resource_new_from_data") (GLibBytesRecord.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioResourceRecord.PolyML.cPtr)
      val enumerateChildren_ =
        call (getSymbol "g_resource_enumerate_children")
          (
            GioResourceRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioResourceLookupFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> Utf8CPtrArray.PolyML.cOutPtr
          )
      val getInfo_ =
        call (getSymbol "g_resource_get_info")
          (
            GioResourceRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioResourceLookupFlags.PolyML.cVal
             &&> GSize.PolyML.cRef
             &&> GUInt32.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val lookupData_ =
        call (getSymbol "g_resource_lookup_data")
          (
            GioResourceRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioResourceLookupFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GLibBytesRecord.PolyML.cPtr
          )
      val openStream_ =
        call (getSymbol "g_resource_open_stream")
          (
            GioResourceRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioResourceLookupFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioInputStreamClass.PolyML.cPtr
          )
      val load_ = call (getSymbol "g_resource_load") (Utf8.PolyML.cInPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GioResourceRecord.PolyML.cPtr)
    end
    type t = GioResourceRecord.t
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type resource_lookup_flags_t = GioResourceLookupFlags.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromData data = (GLibBytesRecord.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GioResourceRecord.FFI.fromPtr true) newFromData_ (data & [])
    fun enumerateChildren self (path, lookupFlags) =
      (
        GioResourceRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioResourceLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> Utf8CPtrArray.FFI.fromPtr ~1
      )
        enumerateChildren_
        (
          self
           & path
           & lookupFlags
           & []
        )
    fun getInfo self (path, lookupFlags) =
      let
        val size
         & flags
         & () =
          (
            GioResourceRecord.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GioResourceLookupFlags.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GUInt32.FFI.fromVal
                   && ignore
          )
            getInfo_
            (
              self
               & path
               & lookupFlags
               & GSize.null
               & GUInt32.null
               & []
            )
      in
        (size, flags)
      end
    fun lookupData self (path, lookupFlags) =
      (
        GioResourceRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioResourceLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        lookupData_
        (
          self
           & path
           & lookupFlags
           & []
        )
    fun openStream self (path, lookupFlags) =
      (
        GioResourceRecord.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioResourceLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioInputStreamClass.FFI.fromPtr true
      )
        openStream_
        (
          self
           & path
           & lookupFlags
           & []
        )
    fun load filename = (Utf8.FFI.withPtr 0 &&&> GLibErrorRecord.handleError ---> GioResourceRecord.FFI.fromPtr true) load_ (filename & [])
  end
