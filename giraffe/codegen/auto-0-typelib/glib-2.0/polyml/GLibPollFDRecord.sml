structure GLibPollFDRecord :> G_LIB_POLL_F_D_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val new_ = call (getSymbol "giraffe_g_lib_poll_f_d_new") (cVoid --> cPtr)
      val copy_ = call (getSymbol "giraffe_g_lib_poll_f_d_copy") (cPtr &&> cPtr --> cVoid)
      val free_ = call (getSymbol "giraffe_g_lib_poll_f_d_free") (cPtr --> cVoid)
      val size_ = call (getSymbol "giraffe_g_lib_poll_f_d_size") (cVoid --> GUInt.PolyML.cVal)
    end
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val new_ = new_
        val copy_ = copy_
        val take_ = ignore
        val clear_ = ignore
        val free_ = free_
        val size_ = size_
      )
    open Record
  end
