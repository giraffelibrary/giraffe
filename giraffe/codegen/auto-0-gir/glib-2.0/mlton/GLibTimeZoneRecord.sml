structure GLibTimeZoneRecord :> G_LIB_TIME_ZONE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val dup_ = _import "g_time_zone_ref" : notnull p -> notnull p;
    val free_ = _import "g_time_zone_unref" : notnull p -> unit;
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record
  end
