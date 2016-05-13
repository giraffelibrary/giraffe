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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_list_store_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val append_ = call (load_sym libgtk "gtk_list_store_append") (GtkListStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val clear_ = call (load_sym libgtk "gtk_list_store_clear") (GtkListStoreClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val insert_ =
        call (load_sym libgtk "gtk_list_store_insert")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val insertAfter_ =
        call (load_sym libgtk "gtk_list_store_insert_after")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val insertBefore_ =
        call (load_sym libgtk "gtk_list_store_insert_before")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val iterIsValid_ = call (load_sym libgtk "gtk_list_store_iter_is_valid") (GtkListStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val moveAfter_ =
        call (load_sym libgtk "gtk_list_store_move_after")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val moveBefore_ =
        call (load_sym libgtk "gtk_list_store_move_before")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val prepend_ = call (load_sym libgtk "gtk_list_store_prepend") (GtkListStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val remove_ = call (load_sym libgtk "gtk_list_store_remove") (GtkListStoreClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setValue_ =
        call (load_sym libgtk "gtk_list_store_set_value")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> GObjectValueRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val swap_ =
        call (load_sym libgtk "gtk_list_store_swap")
          (
            GtkListStoreClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
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
             &&&> FFI.Int32.C.withVal
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
