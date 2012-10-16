structure GtkListStore :>
  GTK_LIST_STORE
    where type 'a class_t = 'a GtkListStoreClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a treedragdestclass_t = 'a GtkTreeDragDestClass.t
    where type 'a treedragsourceclass_t = 'a GtkTreeDragSourceClass.t
    where type 'a treemodelclass_t = 'a GtkTreeModelClass.t
    where type 'a treesortableclass_t = 'a GtkTreeSortableClass.t
    where type treeiterrecord_t = GtkTreeIterRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_list_store_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val append_ = call (load_sym libgtk "gtk_list_store_append") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val clear_ = call (load_sym libgtk "gtk_list_store_clear") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val insert_ =
        call (load_sym libgtk "gtk_list_store_insert")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
      val insertAfter_ =
        call (load_sym libgtk "gtk_list_store_insert_after")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val insertBefore_ =
        call (load_sym libgtk "gtk_list_store_insert_before")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val iterIsValid_ = call (load_sym libgtk "gtk_list_store_iter_is_valid") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val moveAfter_ =
        call (load_sym libgtk "gtk_list_store_move_after")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val moveBefore_ =
        call (load_sym libgtk "gtk_list_store_move_before")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
      val prepend_ = call (load_sym libgtk "gtk_list_store_prepend") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val remove_ = call (load_sym libgtk "gtk_list_store_remove") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setValue_ =
        call (load_sym libgtk "gtk_list_store_set_value")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val swap_ =
        call (load_sym libgtk "gtk_list_store_swap")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkListStoreClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a treedragdestclass_t = 'a GtkTreeDragDestClass.t
    type 'a treedragsourceclass_t = 'a GtkTreeDragSourceClass.t
    type 'a treemodelclass_t = 'a GtkTreeModelClass.t
    type 'a treesortableclass_t = 'a GtkTreeSortableClass.t
    type treeiterrecord_t = GtkTreeIterRecord.t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asTreeDragDest self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragDestClass.C.fromPtr false) I self
    fun asTreeDragSource self = (GObjectObjectClass.C.withPtr ---> GtkTreeDragSourceClass.C.fromPtr false) I self
    fun asTreeModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) I self
    fun asTreeSortable self = (GObjectObjectClass.C.withPtr ---> GtkTreeSortableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun append self =
      let
        val iter & () = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && I) append_ (self & ())
      in
        iter
      end
    fun clear self = (GObjectObjectClass.C.withPtr ---> I) clear_ self
    fun insert self position =
      let
        val iter & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> FFI.Int32.withVal
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
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun iterIsValid self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.fromVal) iterIsValid_ (self & iter)
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
    fun prepend self =
      let
        val iter & () = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && I) prepend_ (self & ())
      in
        iter
      end
    fun remove self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.fromVal) remove_ (self & iter)
    fun setValue self iter column value =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         &&&> FFI.Int32.withVal
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
