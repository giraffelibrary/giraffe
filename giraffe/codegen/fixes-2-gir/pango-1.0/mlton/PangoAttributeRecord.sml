structure PangoAttributeRecord :> PANGO_ATTRIBUTE_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val copy_ = _import "pango_attribute_copy" : notnull p -> notnull p;
    val free_ = _import "pango_attribute_destroy" : notnull p -> unit;

    structure Record =
      BoxedRecord (
        type notnull = notnull
        type 'a p = 'a p
        val take_ = ignore
        val copy_ = copy_
        val free_ = free_
      )
    open Record
  end
