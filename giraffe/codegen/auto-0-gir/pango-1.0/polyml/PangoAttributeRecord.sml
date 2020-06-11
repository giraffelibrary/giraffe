structure PangoAttributeRecord :> PANGO_ATTRIBUTE_RECORD =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val dup_ = call (getSymbol "pango_attribute_copy") (cPtr --> cPtr)
      val free_ = call (getSymbol "pango_attribute_destroy") (cPtr --> cVoid)
    end
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = ignore
        val free_ = free_
      )
    open Record
  end
