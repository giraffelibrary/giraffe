structure GtkTreeStore :>
  GTK_TREE_STORE
    where type 'a class = 'a GtkTreeStoreClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a tree_drag_dest_class = 'a GtkTreeDragDestClass.class
    where type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    where type tree_iter_t = GtkTreeIterRecord.t =
  struct
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt.C.ValueType
        structure ElemSequence = CValueVectorSequence(GInt.C.ValueType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
    structure GObjectValueRecordCVectorNType =
      CValueCVectorNType(
        structure CElemType = GObjectValueRecord.C.ValueType
        structure ElemSequence = CValueVectorSequence(GObjectValueRecord.C.ValueType)
      )
    structure GObjectValueRecordCVectorN = CVectorN(GObjectValueRecordCVectorNType)
    structure GObjectTypeCVectorNType =
      CValueCVectorNType(
        structure CElemType = GObjectType.C.ValueType
        structure ElemSequence = CValueVectorSequence(GObjectType.C.ValueType)
      )
    structure GObjectTypeCVectorN = CVectorN(GObjectTypeCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_store_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tree_store_newv") (GInt.PolyML.cVal &&> GObjectTypeCVectorN.PolyML.cInPtr --> GtkTreeStoreClass.PolyML.cPtr)
      val append_ =
        call (getSymbol "gtk_tree_store_append")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val clear_ = call (getSymbol "gtk_tree_store_clear") (GtkTreeStoreClass.PolyML.cPtr --> cVoid)
      val insert_ =
        call (getSymbol "gtk_tree_store_insert")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val insertAfter_ =
        call (getSymbol "gtk_tree_store_insert_after")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val insertBefore_ =
        call (getSymbol "gtk_tree_store_insert_before")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val insertWithValues_ =
        call (getSymbol "gtk_tree_store_insert_with_valuesv")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             &&> GInt.PolyML.cVal
             &&> GIntCVectorN.PolyML.cInPtr
             &&> GObjectValueRecordCVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val isAncestor_ =
        call (getSymbol "gtk_tree_store_is_ancestor")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val iterDepth_ = call (getSymbol "gtk_tree_store_iter_depth") (GtkTreeStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val iterIsValid_ = call (getSymbol "gtk_tree_store_iter_is_valid") (GtkTreeStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val moveAfter_ =
        call (getSymbol "gtk_tree_store_move_after")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val moveBefore_ =
        call (getSymbol "gtk_tree_store_move_before")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val prepend_ =
        call (getSymbol "gtk_tree_store_prepend")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> cVoid
          )
      val remove_ = call (getSymbol "gtk_tree_store_remove") (GtkTreeStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val setColumnTypes_ =
        call (getSymbol "gtk_tree_store_set_column_types")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GObjectTypeCVectorN.PolyML.cInPtr
             --> cVoid
          )
      val setValue_ =
        call (getSymbol "gtk_tree_store_set_value")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val set_ =
        call (getSymbol "gtk_tree_store_set_valuesv")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GIntCVectorN.PolyML.cInPtr
             &&> GObjectValueRecordCVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val swap_ =
        call (getSymbol "gtk_tree_store_swap")
          (
            GtkTreeStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> cVoid
          )
    end
    type 'a class = 'a GtkTreeStoreClass.class
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
    fun new types =
      let
        val nColumns = LargeInt.fromInt (GObjectTypeCVectorN.length types)
        val retVal = (GInt.FFI.withVal &&&> GObjectTypeCVectorN.FFI.withPtr ---> GtkTreeStoreClass.FFI.fromPtr true) new_ (nColumns & types)
      in
        retVal
      end
    fun append self parent =
      let
        val iter & () =
          (
            GtkTreeStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            append_
            (
              self
               & ()
               & parent
            )
      in
        iter
      end
    fun clear self = (GtkTreeStoreClass.FFI.withPtr ---> I) clear_ self
    fun insert self (parent, position) =
      let
        val iter & () =
          (
            GtkTreeStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             &&&> GInt.FFI.withVal
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            insert_
            (
              self
               & ()
               & parent
               & position
            )
      in
        iter
      end
    fun insertAfter self (parent, sibling) =
      let
        val iter & () =
          (
            GtkTreeStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            insertAfter_
            (
              self
               & ()
               & parent
               & sibling
            )
      in
        iter
      end
    fun insertBefore self (parent, sibling) =
      let
        val iter & () =
          (
            GtkTreeStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            insertBefore_
            (
              self
               & ()
               & parent
               & sibling
            )
      in
        iter
      end
    fun insertWithValues
      self
      (
        parent,
        position,
        columns,
        values
      ) =
      let
        val nValues = LargeInt.fromInt (GObjectValueRecordCVectorN.length values)
        val iter & () =
          (
            GtkTreeStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             &&&> GInt.FFI.withVal
             &&&> GIntCVectorN.FFI.withPtr
             &&&> GObjectValueRecordCVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            insertWithValues_
            (
              self
               & ()
               & parent
               & position
               & columns
               & values
               & nValues
            )
      in
        iter
      end
    fun isAncestor self (iter, descendant) =
      (
        GtkTreeStoreClass.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        isAncestor_
        (
          self
           & iter
           & descendant
        )
    fun iterDepth self iter = (GtkTreeStoreClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) iterDepth_ (self & iter)
    fun iterIsValid self iter = (GtkTreeStoreClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) iterIsValid_ (self & iter)
    fun moveAfter self (iter, position) =
      (
        GtkTreeStoreClass.FFI.withPtr
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
        GtkTreeStoreClass.FFI.withPtr
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
    fun prepend self parent =
      let
        val iter & () =
          (
            GtkTreeStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr
             ---> GtkTreeIterRecord.FFI.fromPtr true && I
          )
            prepend_
            (
              self
               & ()
               & parent
            )
      in
        iter
      end
    fun remove self iter = (GtkTreeStoreClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) remove_ (self & iter)
    fun setColumnTypes self types =
      let
        val nColumns = LargeInt.fromInt (GObjectTypeCVectorN.length types)
        val () =
          (
            GtkTreeStoreClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GObjectTypeCVectorN.FFI.withPtr
             ---> I
          )
            setColumnTypes_
            (
              self
               & nColumns
               & types
            )
      in
        ()
      end
    fun setValue
      self
      (
        iter,
        column,
        value
      ) =
      (
        GtkTreeStoreClass.FFI.withPtr
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
    fun set
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
            GtkTreeStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withPtr
             &&&> GIntCVectorN.FFI.withPtr
             &&&> GObjectValueRecordCVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
             ---> I
          )
            set_
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
        GtkTreeStoreClass.FFI.withPtr
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
