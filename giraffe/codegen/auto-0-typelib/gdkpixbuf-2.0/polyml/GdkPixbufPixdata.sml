structure GdkPixbufPixdata :>
  GDK_PIXBUF_PIXDATA
    where type t = GdkPixbufPixdataRecord.t
    where type pixdata_dump_type_t = GdkPixbufPixdataDumpType.t =
  struct
    local
      open PolyMLFFI
    in
      val deserialize_ =
        call (getSymbol "gdk_pixdata_deserialize")
          (
            GdkPixbufPixdataRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val serialize_ = call (getSymbol "gdk_pixdata_serialize") (GdkPixbufPixdataRecord.PolyML.cPtr &&> GUInt32.PolyML.cRef --> GUInt8CArrayN.PolyML.cOutPtr)
      val toCsource_ =
        call (getSymbol "gdk_pixdata_to_csource")
          (
            GdkPixbufPixdataRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkPixbufPixdataDumpType.PolyML.cVal
             --> GLibStringRecord.PolyML.cPtr
          )
    end
    type t = GdkPixbufPixdataRecord.t
    type pixdata_dump_type_t = GdkPixbufPixdataDumpType.t
    fun deserialize self stream =
      let
        val streamLength = LargeInt.fromInt (GUInt8CArrayN.length stream)
        val () =
          (
            GdkPixbufPixdataRecord.FFI.withPtr
             &&&> GUInt32.FFI.withVal
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
        val streamLengthP & retVal = (GdkPixbufPixdataRecord.FFI.withPtr &&&> GUInt32.FFI.withRefVal ---> GUInt32.FFI.fromVal && GUInt8CArrayN.FFI.fromPtr 1) serialize_ (self & GUInt32.null)
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
