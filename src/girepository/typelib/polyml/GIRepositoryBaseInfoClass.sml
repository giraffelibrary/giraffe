structure GIRepositoryBaseInfoClass :> G_I_REPOSITORY_BASE_INFO_CLASS =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val dup_ =
        call
          (getSymbol "g_base_info_ref")
          (cPtr --> cPtr);

      val free_ =
        call
          (getSymbol "g_base_info_unref")
          (cPtr --> cVoid)
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
    type 'a class = t
    fun toBase obj = obj
  end
