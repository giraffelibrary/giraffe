structure GdkWindowAttrRecord :> GDK_WINDOW_ATTR_RECORD =
  struct
    structure Pointer = CPointerInternal
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val dup_ = call (getSymbol "giraffe_gdk_window_attr_dup") (cPtr --> cPtr)
      val free_ = call (getSymbol "giraffe_gdk_window_attr_free") (cPtr --> cVoid)
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
