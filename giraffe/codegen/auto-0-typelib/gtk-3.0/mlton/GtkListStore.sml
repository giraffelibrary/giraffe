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
    val getType_ = _import "gtk_list_store_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_list_store_newv" :
              GInt32.FFI.val_
               * GObjectTypeCArrayN.MLton.p1
               * GObjectTypeCArrayN.FFI.non_opt GObjectTypeCArrayN.MLton.p2
               -> GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val append_ = fn x1 & x2 => (_import "gtk_list_store_append" : GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> unit;) (x1, x2)
    val clear_ = _import "gtk_list_store_clear" : GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p -> unit;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_list_store_insert" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insertAfter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_list_store_insert_after" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insertBefore_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_list_store_insert_before" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val insertWithValuesv_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & (x6, x7)
         & x8 =>
          (
            _import "mlton_gtk_list_store_insert_with_valuesv" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
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
              x8
            )
    val iterIsValid_ = fn x1 & x2 => (_import "gtk_list_store_iter_is_valid" : GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val moveAfter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_list_store_move_after" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
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
            _import "gtk_list_store_move_before" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val prepend_ = fn x1 & x2 => (_import "gtk_list_store_prepend" : GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> unit;) (x1, x2)
    val remove_ = fn x1 & x2 => (_import "gtk_list_store_remove" : GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val reorder_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_list_store_reorder" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
               * GInt32CArray.MLton.p1
               * GInt32CArray.FFI.non_opt GInt32CArray.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setColumnTypes_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_list_store_set_column_types" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
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
            _import "gtk_list_store_set_value" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
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
            _import "mlton_gtk_list_store_set_valuesv" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
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
            _import "gtk_list_store_swap" :
              GtkListStoreClass.FFI.non_opt GtkListStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
    fun new types =
      let
        val nColumns = LargeInt.fromInt (GObjectTypeCArrayN.length types)
        val retVal = (GInt32.FFI.withVal &&&> GObjectTypeCArrayN.FFI.withPtr ---> GtkListStoreClass.FFI.fromPtr true) new_ (nColumns & types)
      in
        retVal
      end
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
             &&&> GInt32.FFI.withVal
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
        val nValues = LargeInt.fromInt (GObjectValueRecordCArrayN.length values)
        val iter & () =
          (
            GtkListStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32CArrayN.FFI.withPtr
             &&&> GObjectValueRecordCArrayN.FFI.withPtr
             &&&> GInt32.FFI.withVal
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
    fun reorder self newOrder = (GtkListStoreClass.FFI.withPtr &&&> GInt32CArray.FFI.withPtr ---> I) reorder_ (self & newOrder)
    fun setColumnTypes self types =
      let
        val nColumns = LargeInt.fromInt (GObjectTypeCArrayN.length types)
        val () =
          (
            GtkListStoreClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GObjectTypeCArrayN.FFI.withPtr
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
        GtkListStoreClass.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         &&&> GInt32.FFI.withVal
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
        val nValues = LargeInt.fromInt (GObjectValueRecordCArrayN.length values)
        val () =
          (
            GtkListStoreClass.FFI.withPtr
             &&&> GtkTreeIterRecord.FFI.withPtr
             &&&> GInt32CArrayN.FFI.withPtr
             &&&> GObjectValueRecordCArrayN.FFI.withPtr
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
