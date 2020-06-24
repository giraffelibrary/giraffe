structure GioResource :>
  GIO_RESOURCE
    where type t = GioResourceRecord.t
    where type 'a input_stream_class = 'a GioInputStreamClass.class
    where type resource_lookup_flags_t = GioResourceLookupFlags.t =
  struct
    val getType_ = _import "g_resource_get_type" : unit -> GObjectType.FFI.val_;
    val newFromData_ = fn x1 & x2 => (_import "g_resource_new_from_data" : GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GioResourceRecord.FFI.non_opt GioResourceRecord.FFI.p;) (x1, x2)
    val enumerateChildren_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_resource_enumerate_children" :
              GioResourceRecord.FFI.non_opt GioResourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioResourceLookupFlags.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getInfo_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_g_resource_get_info" :
              GioResourceRecord.FFI.non_opt GioResourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioResourceLookupFlags.FFI.val_
               * GSize.FFI.ref_
               * GUInt32.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val lookupData_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_resource_lookup_data" :
              GioResourceRecord.FFI.non_opt GioResourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioResourceLookupFlags.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val openStream_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_g_resource_open_stream" :
              GioResourceRecord.FFI.non_opt GioResourceRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioResourceLookupFlags.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioInputStreamClass.FFI.non_opt GioInputStreamClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val load_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_resource_load" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioResourceRecord.FFI.non_opt GioResourceRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type t = GioResourceRecord.t
    type 'a input_stream_class = 'a GioInputStreamClass.class
    type resource_lookup_flags_t = GioResourceLookupFlags.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newFromData data = (GLibBytesRecord.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioResourceRecord.FFI.fromPtr true) newFromData_ (data & [])
    fun enumerateChildren self (path, lookupFlags) =
      (
        GioResourceRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioResourceLookupFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> Utf8CPtrArray.FFI.fromPtr 2
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
            GioResourceRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
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
        GioResourceRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
        GioResourceRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
    fun load filename = (Utf8.FFI.withPtr &&&> GLibErrorRecord.handleError ---> GioResourceRecord.FFI.fromPtr true) load_ (filename & [])
  end
