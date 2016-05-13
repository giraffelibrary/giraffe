structure PangoAttributeRecord :> PANGO_ATTRIBUTE_RECORD =
  struct
    structure Pointer = CPointer
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val copy_ =
        call
          (load_sym libpango "pango_attribute_copy")
          (cPtr --> cPtr)

      val free_ =
        call
          (load_sym libpango "pango_attribute_destroy")
          (cPtr --> PolyMLFFI.cVoid)
    end

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
