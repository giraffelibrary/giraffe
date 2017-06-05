structure PangoAttributeRecord :> PANGO_ATTRIBUTE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val dup_ = _import "pango_attribute_copy" : notnull p -> notnull p;
    val free_ = _import "pango_attribute_destroy" : notnull p -> unit;

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
