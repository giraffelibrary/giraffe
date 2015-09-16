structure GtkTreeStore :>
  GTK_TREE_STORE
    where type 'a class_t = 'a GtkTreeStoreClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a tree_drag_dest_class_t = 'a GtkTreeDragDestClass.t
    where type 'a tree_drag_source_class_t = 'a GtkTreeDragSourceClass.t
    where type 'a tree_model_class_t = 'a GtkTreeModelClass.t
    where type 'a tree_sortable_class_t = 'a GtkTreeSortableClass.t
    where type tree_iter_record_t = GtkTreeIterRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_store_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val append_ =
        call (load_sym libgtk "gtk_tree_store_append")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val clear_ = call (load_sym libgtk "gtk_tree_store_clear") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val insert_ =
        call (load_sym libgtk "gtk_tree_store_insert")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val insertAfter_ =
        call (load_sym libgtk "gtk_tree_store_insert_after")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val insertBefore_ =
        call (load_sym libgtk "gtk_tree_store_insert_before")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val isAncestor_ =
        call (load_sym libgtk "gtk_tree_store_is_ancestor")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val iterDepth_ = call (load_sym libgtk "gtk_tree_store_iter_depth") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val iterIsValid_ = call (load_sym libgtk "gtk_tree_store_iter_is_valid") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val moveAfter_ =
        call (load_sym libgtk "gtk_tree_store_move_after")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val moveBefore_ =
        call (load_sym libgtk "gtk_tree_store_move_before")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val prepend_ =
        call (load_sym libgtk "gtk_tree_store_prepend")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val remove_ = call (load_sym libgtk "gtk_tree_store_remove") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setValue_ =
        call (load_sym libgtk "gtk_tree_store_set_value")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val swap_ =
        call (load_sym libgtk "gtk_tree_store_swap")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkTreeStoreClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a tree_drag_dest_class_t = 'a GtkTreeDragDestClass.t
    type 'a tree_drag_source_class_t = 'a GtkTreeDragSourceClass.t
    type 'a tree_model_class_t = 'a GtkTreeModelClass.t
    type 'a tree_sortable_class_t = 'a GtkTreeSortableClass.t
    type tree_iter_record_t = GtkTreeIterRecord.t
    type t = base class_t
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
            GObjectObjectClass.C.withPtr
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
    fun clear self = (GObjectObjectClass.C.withPtr ---> I) clear_ self
    fun insert self parent position =
      let
        val iter & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             &&&> FFI.Int32.C.withVal
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
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun iterDepth self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Int32.C.fromVal) iterDepth_ (self & iter)
    fun iterIsValid self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterIsValid_ (self & iter)
    fun moveAfter self iter position =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun remove self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) remove_ (self & iter)
    fun setValue self iter column value =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
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
        GObjectObjectClass.C.withPtr
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
