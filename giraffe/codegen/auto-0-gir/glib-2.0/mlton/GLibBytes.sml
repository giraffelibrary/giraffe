structure GLibBytes :>
  G_LIB_BYTES
    where type t = GLibBytesRecord.t =
  struct
    val getType_ = _import "g_bytes_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_bytes_new" :
              GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newTake_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_bytes_new_take" :
              GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.opt GUInt8CArrayN.MLton.p2
               * GSize.FFI.val_
               -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val compare_ = fn x1 & x2 => (_import "g_bytes_compare" : GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p * GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val equal_ = fn x1 & x2 => (_import "g_bytes_equal" : GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p * GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getData_ = fn x1 & x2 => (_import "g_bytes_get_data" : GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p * GSize.FFI.ref_ -> GUInt8CArrayN.FFI.opt GUInt8CArrayN.FFI.out_p;) (x1, x2)
    val getSize_ = _import "g_bytes_get_size" : GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p -> GSize.FFI.val_;
    val hash_ = _import "g_bytes_hash" : GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p -> GUInt.FFI.val_;
    val newFromBytes_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_bytes_new_from_bytes" :
              GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p
               * GSize.FFI.val_
               * GSize.FFI.val_
               -> GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val unrefToData_ = fn x1 & x2 => (_import "g_bytes_unref_to_data" : GLibBytesRecord.FFI.non_opt GLibBytesRecord.FFI.p * GSize.FFI.ref_ -> GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.FFI.out_p;) (x1, x2)
    type t = GLibBytesRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new data =
      let
        val size =
          case data of
            SOME data => GUInt8CArrayN.length data
          | NONE => GSize.null
        val retVal = (GUInt8CArrayN.FFI.withOptPtr 0 &&&> GSize.FFI.withVal ---> GLibBytesRecord.FFI.fromPtr true) new_ (data & size)
      in
        retVal
      end
    fun newTake data =
      let
        val size =
          case data of
            SOME data => GUInt8CArrayN.length data
          | NONE => GSize.null
        val retVal = (GUInt8CArrayN.FFI.withOptPtr ~1 &&&> GSize.FFI.withVal ---> GLibBytesRecord.FFI.fromPtr true) newTake_ (data & size)
      in
        retVal
      end
    fun compare self bytes2 = (GLibBytesRecord.FFI.withPtr false &&&> GLibBytesRecord.FFI.withPtr false ---> GInt.FFI.fromVal) compare_ (self & bytes2)
    fun equal self bytes2 = (GLibBytesRecord.FFI.withPtr false &&&> GLibBytesRecord.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & bytes2)
    fun getData self =
      let
        val size & retVal = (GLibBytesRecord.FFI.withPtr false &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CArrayN.FFI.fromOptPtr 0) getData_ (self & GSize.null)
      in
        retVal size
      end
    fun getSize self = (GLibBytesRecord.FFI.withPtr false ---> GSize.FFI.fromVal) getSize_ self
    fun hash self = (GLibBytesRecord.FFI.withPtr false ---> GUInt.FFI.fromVal) hash_ self
    fun newFromBytes self (offset, length) =
      (
        GLibBytesRecord.FFI.withPtr false
         &&&> GSize.FFI.withVal
         &&&> GSize.FFI.withVal
         ---> GLibBytesRecord.FFI.fromPtr true
      )
        newFromBytes_
        (
          self
           & offset
           & length
        )
    fun unrefToData self =
      let
        val size & retVal = (GLibBytesRecord.FFI.withPtr false &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr ~1) unrefToData_ (self & GSize.null)
      in
        retVal size
      end
  end
