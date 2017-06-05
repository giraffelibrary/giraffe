structure PangoLogAttrRecord :> PANGO_LOG_ATTR_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call
          (load_sym libgiraffepango "giraffe_pango_log_attr_new")
          (cVoid --> cPtr)

      val copy_ =
        call
          (load_sym libgiraffepango "giraffe_pango_log_attr_copy")
          (cPtr &&> cPtr --> cVoid)

      val free_ =
        call
          (load_sym libgiraffepango "giraffe_pango_log_attr_free")
          (cPtr --> cVoid)

      val size_ =
        call
          (load_sym libgiraffepango "giraffe_pango_log_attr_size")
          (cVoid --> GUInt.PolyML.cVal)
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
