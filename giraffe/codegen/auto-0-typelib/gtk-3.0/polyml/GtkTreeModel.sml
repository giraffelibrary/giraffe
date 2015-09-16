structure GtkTreeModel :>
  GTK_TREE_MODEL
    where type 'a class_t = 'a GtkTreeModelClass.t
    where type tree_model_flags_t = GtkTreeModelFlags.t
    where type tree_iter_record_t = GtkTreeIterRecord.t
    where type tree_path_record_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_model_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val filterNew_ = call (load_sym libgtk "gtk_tree_model_filter_new") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val getFlags_ = call (load_sym libgtk "gtk_tree_model_get_flags") (GObjectObjectClass.PolyML.PTR --> GtkTreeModelFlags.PolyML.VAL)
      val getIter_ =
        call (load_sym libgtk "gtk_tree_model_get_iter")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val getIterFirst_ = call (load_sym libgtk "gtk_tree_model_get_iter_first") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getIterFromString_ =
        call (load_sym libgtk "gtk_tree_model_get_iter_from_string")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.Bool.PolyML.VAL
          )
      val getNColumns_ = call (load_sym libgtk "gtk_tree_model_get_n_columns") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getPath_ = call (load_sym libgtk "gtk_tree_model_get_path") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> GtkTreePathRecord.PolyML.PTR)
      val getStringFromIter_ = call (load_sym libgtk "gtk_tree_model_get_string_from_iter") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getValue_ =
        call (load_sym libgtk "gtk_tree_model_get_value")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val iterChildren_ =
        call (load_sym libgtk "gtk_tree_model_iter_children")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             --> FFI.Bool.PolyML.VAL
          )
      val iterHasChild_ = call (load_sym libgtk "gtk_tree_model_iter_has_child") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val iterNChildren_ = call (load_sym libgtk "gtk_tree_model_iter_n_children") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.OPTPTR --> FFI.Int32.PolyML.VAL)
      val iterNext_ = call (load_sym libgtk "gtk_tree_model_iter_next") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val iterNthChild_ =
        call (load_sym libgtk "gtk_tree_model_iter_nth_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.OPTPTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val iterParent_ =
        call (load_sym libgtk "gtk_tree_model_iter_parent")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val iterPrevious_ = call (load_sym libgtk "gtk_tree_model_iter_previous") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val refNode_ = call (load_sym libgtk "gtk_tree_model_ref_node") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val rowChanged_ =
        call (load_sym libgtk "gtk_tree_model_row_changed")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val rowDeleted_ = call (load_sym libgtk "gtk_tree_model_row_deleted") (GObjectObjectClass.PolyML.PTR &&> GtkTreePathRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val rowHasChildToggled_ =
        call (load_sym libgtk "gtk_tree_model_row_has_child_toggled")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val rowInserted_ =
        call (load_sym libgtk "gtk_tree_model_row_inserted")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkTreePathRecord.PolyML.PTR
             &&> GtkTreeIterRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val sortNewWithModel_ = call (load_sym libgtk "gtk_tree_model_sort_new_with_model") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val unrefNode_ = call (load_sym libgtk "gtk_tree_model_unref_node") (GObjectObjectClass.PolyML.PTR &&> GtkTreeIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkTreeModelClass.t
    type tree_model_flags_t = GtkTreeModelFlags.t
    type tree_iter_record_t = GtkTreeIterRecord.t
    type tree_path_record_t = GtkTreePathRecord.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun filterNew self root = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withOptPtr ---> GtkTreeModelClass.C.fromPtr true) filterNew_ (self & root)
    fun getFlags self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelFlags.C.fromVal) getFlags_ self
    fun getIter self path =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreePathRecord.C.withPtr
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            getIter_
            (
              self
               & ()
               & path
            )
      in
        if retVal then SOME iter else NONE
      end
    fun getIterFirst self =
      let
        val iter & retVal = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal) getIterFirst_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getIterFromString self pathString =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> FFI.String.C.withConstPtr
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            getIterFromString_
            (
              self
               & ()
               & pathString
            )
      in
        if retVal then SOME iter else NONE
      end
    fun getNColumns self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNColumns_ self
    fun getPath self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) getPath_ (self & iter)
    fun getStringFromIter self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.String.C.fromPtr true) getStringFromIter_ (self & iter)
    fun getValue self iter column =
      let
        val value & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> GObjectValueRecord.C.withNewPtr
             ---> GObjectValueRecord.C.fromPtr true && I
          )
            getValue_
            (
              self
               & iter
               & column
               & ()
            )
      in
        value
      end
    fun iterChildren self parent =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            iterChildren_
            (
              self
               & ()
               & parent
            )
      in
        if retVal then SOME iter else NONE
      end
    fun iterHasChild self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterHasChild_ (self & iter)
    fun iterNChildren self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withOptPtr ---> FFI.Int32.C.fromVal) iterNChildren_ (self & iter)
    fun iterNext self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterNext_ (self & iter)
    fun iterNthChild self parent n =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             &&&> FFI.Int32.C.withVal
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            iterNthChild_
            (
              self
               & ()
               & parent
               & n
            )
      in
        if retVal then SOME iter else NONE
      end
    fun iterParent self child =
      let
        val iter & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withPtr
             ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            iterParent_
            (
              self
               & ()
               & child
            )
      in
        if retVal then SOME iter else NONE
      end
    fun iterPrevious self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterPrevious_ (self & iter)
    fun refNode self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) refNode_ (self & iter)
    fun rowChanged self path iter =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         ---> I
      )
        rowChanged_
        (
          self
           & path
           & iter
        )
    fun rowDeleted self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) rowDeleted_ (self & path)
    fun rowHasChildToggled self path iter =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         ---> I
      )
        rowHasChildToggled_
        (
          self
           & path
           & iter
        )
    fun rowInserted self path iter =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         ---> I
      )
        rowInserted_
        (
          self
           & path
           & iter
        )
    fun sortNewWithModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr true) sortNewWithModel_ self
    fun unrefNode self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) unrefNode_ (self & iter)
    local
      open ClosureMarshal Signal
    in
      fun rowChangedSig f = signal "row-changed" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
      fun rowDeletedSig f = signal "row-deleted" (get 0w1 GtkTreePathRecord.t ---> ret_void) f
      fun rowHasChildToggledSig f = signal "row-has-child-toggled" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
      fun rowInsertedSig f = signal "row-inserted" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
    end
  end
