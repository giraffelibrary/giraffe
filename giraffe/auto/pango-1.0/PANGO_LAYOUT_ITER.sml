signature PANGO_LAYOUT_ITER =
  sig
    type record_t
    type layoutrunrecord_t
    type rectanglerecord_t
    type layoutlinerecord_t
    type 'a layoutclass_t
    val getType : unit -> GObject.Type.t
    val atLastLine : record_t -> bool
    val copy : record_t -> record_t
    val getBaseline : record_t -> LargeInt.int
    val getCharExtents :
      record_t
       -> rectanglerecord_t
       -> unit
    val getClusterExtents : record_t -> rectanglerecord_t * rectanglerecord_t
    val getIndex : record_t -> LargeInt.int
    val getLayout : record_t -> base layoutclass_t
    val getLayoutExtents : record_t -> rectanglerecord_t * rectanglerecord_t
    val getLine : record_t -> layoutlinerecord_t
    val getLineExtents : record_t -> rectanglerecord_t * rectanglerecord_t
    val getLineReadonly : record_t -> layoutlinerecord_t
    val getLineYrange : record_t -> LargeInt.int * LargeInt.int
    val getRun : record_t -> layoutrunrecord_t
    val getRunExtents : record_t -> rectanglerecord_t * rectanglerecord_t
    val getRunReadonly : record_t -> layoutrunrecord_t
    val nextChar : record_t -> bool
    val nextCluster : record_t -> bool
    val nextLine : record_t -> bool
    val nextRun : record_t -> bool
  end
