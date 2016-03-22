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
    val getType_ = _import "gtk_list_store_get_type" : unit -> GObjectType.C.val_;
    val append_ = fn x1 & x2 => (_import "gtk_list_store_append" : GtkListStoreClass.C.notnull GtkListStoreClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> unit;) (x1, x2)
    val clear_ = _import "gtk_list_store_clear" : GtkListStoreClass.C.notnull GtkListStoreClass.C.p -> unit;
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_list_store_insert" :
              GtkListStoreClass.C.notnull GtkListStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * FFI.Int.C.val_
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
              GtkListStoreClass.C.notnull GtkListStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
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
              GtkListStoreClass.C.notnull GtkListStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val iterIsValid_ = fn x1 & x2 => (_import "gtk_list_store_iter_is_valid" : GtkListStoreClass.C.notnull GtkListStoreClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val moveAfter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_list_store_move_after" :
              GtkListStoreClass.C.notnull GtkListStoreClass.C.p
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
            _import "gtk_list_store_move_before" :
              GtkListStoreClass.C.notnull GtkListStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * unit GtkTreeIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val prepend_ = fn x1 & x2 => (_import "gtk_list_store_prepend" : GtkListStoreClass.C.notnull GtkListStoreClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> unit;) (x1, x2)
    val remove_ = fn x1 & x2 => (_import "gtk_list_store_remove" : GtkListStoreClass.C.notnull GtkListStoreClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val setValue_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_list_store_set_value" :
              GtkListStoreClass.C.notnull GtkListStoreClass.C.p
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
            _import "gtk_list_store_swap" :
              GtkListStoreClass.C.notnull GtkListStoreClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
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
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asTreeDragDest self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragDestClass.C.fromPtr false) I self
    fun asTreeDragSource self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragSourceClass.C.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.C.withPtr ---> GtkTreeSortableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun append self =
      let
        val iter & () = (GtkListStoreClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && I) append_ (self & ())
      in
        iter
      end
    fun clear self = (GtkListStoreClass.C.withPtr ---> I) clear_ self
    fun insert self position =
      let
        val iter & () =
          (
            GtkListStoreClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> FFI.Int.C.withVal
             ---> GtkTreeIterRecord.C.fromPtr true && I
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
            GtkListStoreClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             ---> GtkTreeIterRecord.C.fromPtr true && I
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
            GtkListStoreClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             ---> GtkTreeIterRecord.C.fromPtr true && I
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
    fun iterIsValid self iter = (GtkListStoreClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterIsValid_ (self & iter)
    fun moveAfter self iter position =
      (
        GtkListStoreClass.C.withPtr
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
        GtkListStoreClass.C.withPtr
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
    fun prepend self =
      let
        val iter & () = (GtkListStoreClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && I) prepend_ (self & ())
      in
        iter
      end
    fun remove self iter = (GtkListStoreClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) remove_ (self & iter)
    fun setValue self iter column value =
      (
        GtkListStoreClass.C.withPtr
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
        GtkListStoreClass.C.withPtr
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
