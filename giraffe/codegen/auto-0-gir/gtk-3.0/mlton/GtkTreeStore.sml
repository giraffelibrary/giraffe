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
    val getType_ = _import "gtk_tree_store_get_type" : unit -> GObjectType.C.val_;
    val append_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_append" :
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val clear_ = _import "gtk_tree_store_clear" : GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p -> unit;
    val insert_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_store_insert" :
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               * FFI.Int.C.val_
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
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
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
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isAncestor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_is_ancestor" :
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterDepth_ = fn x1 & x2 => (_import "gtk_tree_store_iter_depth" : GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Int.C.val_;) (x1, x2)
    val iterIsValid_ = fn x1 & x2 => (_import "gtk_tree_store_iter_is_valid" : GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val moveAfter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_move_after" :
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
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
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
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
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_tree_store_remove" : GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val setValue_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_store_set_value" :
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * FFI.Int.C.val_
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val swap_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_swap" :
              GtkTreeStoreClass.C.notnull GtkTreeStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
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
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asTreeDragDest self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragDestClass.C.fromPtr false) I self
    fun asTreeDragSource self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragSourceClass.C.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.C.withPtr ---> GtkTreeSortableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun append self parent =
      let
        val iter & () =
          (
            GtkTreeStoreClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             ---> GtkTreeIterRecord.C.fromPtr true && I
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
    fun clear self = (GtkTreeStoreClass.C.withPtr ---> I) clear_ self
    fun insert self parent position =
      let
        val iter & () =
          (
            GtkTreeStoreClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             &&&> FFI.Int.C.withVal
             ---> GtkTreeIterRecord.C.fromPtr true && I
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
    fun insertAfter self parent sibling =
      let
        val iter & () =
          (
            GtkTreeStoreClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             ---> GtkTreeIterRecord.C.fromPtr true && I
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
    fun insertBefore self parent sibling =
      let
        val iter & () =
          (
            GtkTreeStoreClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             ---> GtkTreeIterRecord.C.fromPtr true && I
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
    fun isAncestor self iter descendant =
      (
        GtkTreeStoreClass.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        isAncestor_
        (
          self
           & iter
           & descendant
        )
    fun iterDepth self iter = (GtkTreeStoreClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Int.C.fromVal) iterDepth_ (self & iter)
    fun iterIsValid self iter = (GtkTreeStoreClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterIsValid_ (self & iter)
    fun moveAfter self iter position =
      (
        GtkTreeStoreClass.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withOptPtr
         ---> I
      )
        moveAfter_
        (
          self
           & iter
           & position
        )
    fun moveBefore self iter position =
      (
        GtkTreeStoreClass.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withOptPtr
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
            GtkTreeStoreClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             ---> GtkTreeIterRecord.C.fromPtr true && I
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
    fun remove self iter = (GtkTreeStoreClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) remove_ (self & iter)
    fun setValue self iter column value =
      (
        GtkTreeStoreClass.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        setValue_
        (
          self
           & iter
           & column
           & value
        )
    fun swap self a b =
      (
        GtkTreeStoreClass.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         ---> I
      )
        swap_
        (
          self
           & a
           & b
        )
  end
