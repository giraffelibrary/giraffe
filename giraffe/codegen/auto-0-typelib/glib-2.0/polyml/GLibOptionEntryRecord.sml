structure GLibOptionEntryRecord :> G_LIB_OPTION_ENTRY_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val size_ = fn () => 48
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
        type notnull = notnull
        type 'a p = 'a p
        val copy_ = copy_
        val clear_ = clear_
        val size_ = size_
      )
    open Record
  end
