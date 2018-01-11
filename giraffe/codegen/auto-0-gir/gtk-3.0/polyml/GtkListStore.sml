structure GtkListStore :>
  GTK_LIST_STORE
    where type 'a class = 'a GtkListStoreClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a tree_drag_dest_class = 'a GtkTreeDragDestClass.class
    where type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    where type tree_iter_t = GtkTreeIterRecord.t =
  struct
    structure GIntCVectorType =
      CValueCVectorType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVector = CVector(GIntCVectorType)
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
    structure GObjectValueRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GObjectValueRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GObjectValueRecordCVectorN = CVectorN(GObjectValueRecordCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_list_store_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val append_ = call (getSymbol "gtk_list_store_append") (GtkListStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> cVoid)
      val clear_ = call (getSymbol "gtk_list_store_clear") (GtkListStoreClass.PolyML.cPtr --> cVoid)
      val insert_ =
        call (getSymbol "gtk_list_store_insert")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val insertAfter_ =
        call (getSymbol "gtk_list_store_insert_after")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val insertBefore_ =
        call (getSymbol "gtk_list_store_insert_before")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val insertWithValuesv_ =
        call (getSymbol "gtk_list_store_insert_with_valuesv")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GIntCVectorN.PolyML.cInPtr
             &&> GObjectValueRecordCVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val iterIsValid_ = call (getSymbol "gtk_list_store_iter_is_valid") (GtkListStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val moveAfter_ =
        call (getSymbol "gtk_list_store_move_after")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val moveBefore_ =
        call (getSymbol "gtk_list_store_move_before")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val prepend_ = call (getSymbol "gtk_list_store_prepend") (GtkListStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> cVoid)
      val remove_ = call (getSymbol "gtk_list_store_remove") (GtkListStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val reorder_ = call (getSymbol "gtk_list_store_reorder") (GtkListStoreClass.PolyML.cPtr &&> GIntCVector.PolyML.cInPtr --> cVoid)
      val setValue_ =
        call (getSymbol "gtk_list_store_set_value")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val setValuesv_ =
        call (getSymbol "gtk_list_store_set_valuesv")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GIntCVectorN.PolyML.cInPtr
             &&> GObjectValueRecordCVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val swap_ =
        call (getSymbol "gtk_list_store_swap")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> cVoid
          )
    end
    type 'a class = 'a GtkListStoreClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a tree_drag_dest_class = 'a GtkTreeDragDestClass.class
    type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asTreeDragDest self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeDragDestClass.FFI.fromPtr false) I self
    fun asTreeDragSource self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeDragSourceClass.FFI.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeSortableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun append self =
      let
        val iter & () = (GtkListStoreClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withNewPtr ---> GtkTreeIterRecord.FFI.fromPtr true && I) append_ (self & ())
      in
        iter
      end
    fun clear self = (GtkListStoreClass.FFI.withPtr ---> I) clear_ self
    fun insert self position =
      let
        val iter & () =
          (
            GtkListStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            insert_
            (
              self
               & ()
               & position
            )
      in
        iter
      end
    fun insertAfter self sibling =
      let
        val iter & () =
          (
            GtkListStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            insertAfter_
            (
              self
               & ()
               & sibling
            )
      in
        iter
      end
    fun insertBefore self sibling =
      let
        val iter & () =
          (
            GtkListStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            insertBefore_
            (
              self
               & ()
               & sibling
            )
      in
        iter
      end
    fun insertWithValuesv
      self
      (
        position,
        columns,
        values
      ) =
      let
        val nValues = LargeInt.fromInt (GObjectValueRecordCVectorN.length values)
        val iter & () =
          (
            GtkListStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             &&&> GIntCVectorN.FFI.withPtr
             &&&> GObjectValueRecordCVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            insertWithValuesv_
            (
              self
               & ()
               & position
               & columns
               & values
               & nValues
            )
      in
        iter
      end
    fun iterIsValid self iter = (GtkListStoreClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) iterIsValid_ (self & iter)
    fun moveAfter self (iter, position) =
      (
        GtkListStoreClass.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withOptPtr
         ---> I
      )
        moveAfter_
        (
          self
           & iter
           & position
        )
    fun moveBefore self (iter, position) =
      (
        GtkListStoreClass.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withOptPtr
         ---> I
      )
        moveBefore_
        (
          self
           & iter
           & position
        )
    fun prepend self =
      let
        val iter & () = (GtkListStoreClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withNewPtr ---> GtkTreeIterRecord.FFI.fromPtr true && I) prepend_ (self & ())
      in
        iter
      end
    fun remove self iter = (GtkListStoreClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) remove_ (self & iter)
    fun reorder self newOrder = (GtkListStoreClass.FFI.withPtr &&&> GIntCVector.FFI.withPtr ---> I) reorder_ (self & newOrder)
    fun setValue
      self
      (
        iter,
        column,
        value
      ) =
      (
        GtkListStoreClass.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        setValue_
        (
          self
           & iter
           & column
           & value
        )
    fun setValuesv
      self
      (
        iter,
        columns,
        values
      ) =
      let
        val nValues = LargeInt.fromInt (GObjectValueRecordCVectorN.length values)
        val () =
          (
            GtkListStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withPtr
             &&&> GIntCVectorN.FFI.withPtr
             &&&> GObjectValueRecordCVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
             ---> I
          )
            setValuesv_
            (
              self
               & iter
               & columns
               & values
               & nValues
            )
      in
        ()
      end
    fun swap self (a, b) =
      (
        GtkListStoreClass.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         ---> I
      )
        swap_
        (
          self
           & a
           & b
        )
  end
