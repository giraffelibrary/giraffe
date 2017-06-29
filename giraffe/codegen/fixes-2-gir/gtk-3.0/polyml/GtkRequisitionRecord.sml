structure GtkRequisitionRecord :> GTK_REQUISITION_RECORD =
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
          (getSymbol "giraffe_gtk_requisition_new")
          (cVoid --> cPtr)

      val copy_ =
        call
          (getSymbol "giraffe_gtk_requisition_copy")
          (cPtr &&> cPtr --> cVoid)

      val free_ =
        call
          (getSymbol "giraffe_gtk_requisition_free")
          (cPtr --> cVoid)

      val size_ =
        call
          (getSymbol "giraffe_gtk_requisition_size")
          (cVoid --> GUInt.PolyML.cVal)

      val getType_ =
        call
          (getSymbol "gtk_requisition_get_type")
          (cVoid --> GObjectType.PolyML.cVal);
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

    structure Type =
      BoxedType(
        structure Record = Record
        type t = t
        val getType_ = getType_
      )
    open Type
  end
