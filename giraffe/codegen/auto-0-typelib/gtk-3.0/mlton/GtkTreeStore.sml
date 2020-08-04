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
    val getType_ = _import "gtk_tree_store_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_tree_store_newv" :
              GInt32.FFI.val_
               * GObjectTypeCArrayN.MLton.p1
               * GObjectTypeCArrayN.FFI.non_opt GObjectTypeCArrayN.MLton.p2
               -> GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val append_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_append" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val clear_ = _import "gtk_tree_store_clear" : GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p -> unit;
    val insert_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_store_insert" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val insertAfter_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_store_insert_after" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val insertBefore_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_store_insert_before" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val insertWithValues_ =
      fn
        x1
         & x2
         & x3
         & x4
         & (x5, x6)
         & (x7, x8)
         & x9 =>
          (
            _import "mlton_gtk_tree_store_insert_with_valuesv" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32CArrayN.MLton.p1
               * GInt32CArrayN.FFI.non_opt GInt32CArrayN.MLton.p2
               * GObjectValueRecordCArrayN.MLton.p1
               * GObjectValueRecordCArrayN.FFI.non_opt GObjectValueRecordCArrayN.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val isAncestor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_is_ancestor" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterDepth_ = fn x1 & x2 => (_import "gtk_tree_store_iter_depth" : GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val iterIsValid_ = fn x1 & x2 => (_import "gtk_tree_store_iter_is_valid" : GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val moveAfter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_move_after" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val moveBefore_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_move_before" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val prepend_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_prepend" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_tree_store_remove" : GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setColumnTypes_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_tree_store_set_column_types" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GInt32.FFI.val_
               * GObjectTypeCArrayN.MLton.p1
               * GObjectTypeCArrayN.FFI.non_opt GObjectTypeCArrayN.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setValue_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_store_set_value" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GInt32.FFI.val_
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val set_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6)
         & x7 =>
          (
            _import "mlton_gtk_tree_store_set_valuesv" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GInt32CArrayN.MLton.p1
               * GInt32CArrayN.FFI.non_opt GInt32CArrayN.MLton.p2
               * GObjectValueRecordCArrayN.MLton.p1
               * GObjectValueRecordCArrayN.FFI.non_opt GObjectValueRecordCArrayN.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val swap_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_swap" :
              GtkTreeStoreClass.FFI.non_opt GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkTreeStoreClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a tree_drag_dest_class = 'a GtkTreeDragDestClass.class
    type 'a tree_drag_source_class = 'a GtkTreeDragSourceClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type 'a tree_sortable_class = 'a GtkTreeSortableClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asTreeDragDest self = (GObjectObjectClass.FFI.withPtr false ---> GtkTreeDragDestClass.FFI.fromPtr false) I self
    fun asTreeDragSource self = (GObjectObjectClass.FFI.withPtr false ---> GtkTreeDragSourceClass.FFI.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.FFI.withPtr false ---> GtkTreeSortableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new types =
      let
        val nColumns = LargeInt.fromInt (GObjectTypeCArrayN.length types)
        val retVal = (GInt32.FFI.withVal &&&> GObjectTypeCArrayN.FFI.withPtr 0 ---> GtkTreeStoreClass.FFI.fromPtr true) new_ (nColumns & types)
      in
        retVal
      end
    fun append self parent =
      let
        val iter & () =
          (
            GtkTreeStoreClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
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
    fun clear self = (GtkTreeStoreClass.FFI.withPtr false ---> I) clear_ self
    fun insert self (parent, position) =
      let
        val iter & () =
          (
            GtkTreeStoreClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
             &&&> GInt32.FFI.withVal
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
            GtkTreeStoreClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
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
            GtkTreeStoreClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
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
        val nValues = LargeInt.fromInt (GObjectValueRecordCArrayN.length values)
        val iter & () =
          (
            GtkTreeStoreClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32CArrayN.FFI.withPtr 0
             &&&> GObjectValueRecordCArrayN.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
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
        GtkTreeStoreClass.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        isAncestor_
        (
          self
           & iter
           & descendant
        )
    fun iterDepth self iter = (GtkTreeStoreClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) iterDepth_ (self & iter)
    fun iterIsValid self iter = (GtkTreeStoreClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) iterIsValid_ (self & iter)
    fun moveAfter self (iter, position) =
      (
        GtkTreeStoreClass.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withOptPtr false
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
        GtkTreeStoreClass.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withOptPtr false
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
            GtkTreeStoreClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GtkTreeIterRecord.FFI.withOptPtr false
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
    fun remove self iter = (GtkTreeStoreClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) remove_ (self & iter)
    fun setColumnTypes self types =
      let
        val nColumns = LargeInt.fromInt (GObjectTypeCArrayN.length types)
        val () =
          (
            GtkTreeStoreClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GObjectTypeCArrayN.FFI.withPtr 0
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
        GtkTreeStoreClass.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GObjectValueRecord.FFI.withPtr false
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
        val nValues = LargeInt.fromInt (GObjectValueRecordCArrayN.length values)
        val () =
          (
            GtkTreeStoreClass.FFI.withPtr false
             &&&> GtkTreeIterRecord.FFI.withPtr false
             &&&> GInt32CArrayN.FFI.withPtr 0
             &&&> GObjectValueRecordCArrayN.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
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
        GtkTreeStoreClass.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
         ---> I
      )
        swap_
        (
          self
           & a
           & b
        )
  end
