structure GdkPixbufPixdata :>
  GDK_PIXBUF_PIXDATA
    where type t = GdkPixbufPixdataRecord.t
    where type pixdata_dump_type_t = GdkPixbufPixdataDumpType.t =
  struct
    val deserialize_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gdk_pixdata_deserialize" :
              GdkPixbufPixdataRecord.FFI.notnull GdkPixbufPixdataRecord.FFI.p
               * GUInt.FFI.val_
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.notnull GUInt8CArrayN.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val serialize_ = fn x1 & x2 => (_import "gdk_pixdata_serialize" : GdkPixbufPixdataRecord.FFI.notnull GdkPixbufPixdataRecord.FFI.p * GUInt.FFI.ref_ -> GUInt8CArrayN.FFI.notnull GUInt8CArrayN.FFI.out_p;) (x1, x2)
    val toCsource_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gdk_pixdata_to_csource" :
              GdkPixbufPixdataRecord.FFI.notnull GdkPixbufPixdataRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GdkPixbufPixdataDumpType.FFI.val_
               -> GLibStringRecord.FFI.notnull GLibStringRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type t = GdkPixbufPixdataRecord.t
    type pixdata_dump_type_t = GdkPixbufPixdataDumpType.t
    fun deserialize self stream =
      let
        val streamLength = LargeInt.fromInt (GUInt8CArrayN.length stream)
        val () =
          (
            GdkPixbufPixdataRecord.FFI.withPtr
             &&&> GUInt.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GLibErrorRecord.handleError
             ---> ignore
          )
            deserialize_
            (
              self
               & streamLength
               & stream
               & []
            )
      in
        ()
      end
    fun serialize self =
      let
        val streamLengthP & retVal = (GdkPixbufPixdataRecord.FFI.withPtr &&&> GUInt.FFI.withRefVal ---> GUInt.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 1) serialize_ (self & GUInt.null)
      in
        retVal (LargeInt.toInt streamLengthP)
      end
    fun toCsource self (name, dumpType) =
      (
        GdkPixbufPixdataRecord.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GdkPixbufPixdataDumpType.FFI.withVal
         ---> GLibStringRecord.FFI.fromPtr true
      )
        toCsource_
        (
          self
           & name
           & dumpType
        )
  end
