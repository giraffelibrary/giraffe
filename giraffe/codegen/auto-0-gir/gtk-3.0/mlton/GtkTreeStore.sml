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
    val append_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_append" :
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * unit GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val clear_ = _import "gtk_tree_store_clear" : GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p -> unit;
    val insert_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_store_insert" :
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * unit GtkTreeIterRecord.FFI.p
               * GInt.FFI.val_
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
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * unit GtkTreeIterRecord.FFI.p
               * unit GtkTreeIterRecord.FFI.p
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
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * unit GtkTreeIterRecord.FFI.p
               * unit GtkTreeIterRecord.FFI.p
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
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterDepth_ = fn x1 & x2 => (_import "gtk_tree_store_iter_depth" : GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val iterIsValid_ = fn x1 & x2 => (_import "gtk_tree_store_iter_is_valid" : GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val moveAfter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_store_move_after" :
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * unit GtkTreeIterRecord.FFI.p
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
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * unit GtkTreeIterRecord.FFI.p
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
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * unit GtkTreeIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_tree_store_remove" : GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setValue_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_store_set_value" :
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * GInt.FFI.val_
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
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
              GtkTreeStoreClass.FFI.notnull GtkTreeStoreClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
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
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asTreeDragDest self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeDragDestClass.FFI.fromPtr false) I self
    fun asTreeDragSource self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeDragSourceClass.FFI.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.FFI.withPtr ---> GtkTreeSortableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
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
