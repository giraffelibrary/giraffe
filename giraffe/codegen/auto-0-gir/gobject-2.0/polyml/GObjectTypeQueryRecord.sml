structure GObjectTypeQueryRecord :> G_OBJECT_TYPE_QUERY_RECORD =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val size_ = call (getSymbol "giraffe_g_object_type_query_size") (cVoid --> GSize.PolyML.cVal)
      val memcpy_ =
        call (getSymbol "memcpy")
          (
            cPtr
             &&> cPtr
             &&> GSize.PolyML.cVal
             --> cVoid
          )
      val copy_ =
        fn
          src & dest =>
            memcpy_
              (
                dest
                 & src
                 & size_ ()
              )
      val clear_ = Fn.ignore
    end
    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        val copy_ = copy_
        val clear_ = clear_
        val size_ = size_
      )
    open Record
  end
