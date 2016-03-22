structure GtkTreeModel :>
  GTK_TREE_MODEL
    where type 'a class = 'a GtkTreeModelClass.class
    where type tree_model_flags_t = GtkTreeModelFlags.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type tree_path_t = GtkTreePathRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_model_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val filterNew_ = call (load_sym libgtk "gtk_tree_model_filter_new") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cOptPtr --> GtkTreeModelClass.PolyML.cPtr)
      val getFlags_ = call (load_sym libgtk "gtk_tree_model_get_flags") (GtkTreeModelClass.PolyML.cPtr --> GtkTreeModelFlags.PolyML.cVal)
      val getIter_ =
        call (load_sym libgtk "gtk_tree_model_get_iter")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getIterFirst_ = call (load_sym libgtk "gtk_tree_model_get_iter_first") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIterFromString_ =
        call (load_sym libgtk "gtk_tree_model_get_iter_from_string")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
      val getNColumns_ = call (load_sym libgtk "gtk_tree_model_get_n_columns") (GtkTreeModelClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getPath_ = call (load_sym libgtk "gtk_tree_model_get_path") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> GtkTreePathRecord.PolyML.cPtr)
      val getStringFromIter_ = call (load_sym libgtk "gtk_tree_model_get_string_from_iter") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getValue_ =
        call (load_sym libgtk "gtk_tree_model_get_value")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GObjectValueRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val iterChildren_ =
        call (load_sym libgtk "gtk_tree_model_iter_children")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             --> FFI.Bool.PolyML.cVal
          )
      val iterHasChild_ = call (load_sym libgtk "gtk_tree_model_iter_has_child") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val iterNChildren_ = call (load_sym libgtk "gtk_tree_model_iter_n_children") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cOptPtr --> FFI.Int.PolyML.cVal)
      val iterNext_ = call (load_sym libgtk "gtk_tree_model_iter_next") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val iterNthChild_ =
        call (load_sym libgtk "gtk_tree_model_iter_nth_child")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cOptPtr
             &&> FFI.Int.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val iterParent_ =
        call (load_sym libgtk "gtk_tree_model_iter_parent")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val iterPrevious_ = call (load_sym libgtk "gtk_tree_model_iter_previous") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val refNode_ = call (load_sym libgtk "gtk_tree_model_ref_node") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val rowChanged_ =
        call (load_sym libgtk "gtk_tree_model_row_changed")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val rowDeleted_ = call (load_sym libgtk "gtk_tree_model_row_deleted") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val rowHasChildToggled_ =
        call (load_sym libgtk "gtk_tree_model_row_has_child_toggled")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val rowInserted_ =
        call (load_sym libgtk "gtk_tree_model_row_inserted")
          (
            GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val sortNewWithModel_ = call (load_sym libgtk "gtk_tree_model_sort_new_with_model") (GtkTreeModelClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val unrefNode_ = call (load_sym libgtk "gtk_tree_model_unref_node") (GtkTreeModelClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkTreeModelClass.class
    type tree_model_flags_t = GtkTreeModelFlags.t
    type tree_iter_t = GtkTreeIterRecord.t
    type tree_path_t = GtkTreePathRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun filterNew self root = (GtkTreeModelClass.C.withPtr &&&> GtkTreePathRecord.C.withOptPtr ---> GtkTreeModelClass.C.fromPtr true) filterNew_ (self & root)
    fun getFlags self = (GtkTreeModelClass.C.withPtr ---> GtkTreeModelFlags.C.fromVal) getFlags_ self
    fun getIter self path =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.C.withPtr
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
        val iter & retVal = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal) getIterFirst_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getIterFromString self pathString =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> Utf8.C.withPtr
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
    fun getNColumns self = (GtkTreeModelClass.C.withPtr ---> FFI.Int.C.fromVal) getNColumns_ self
    fun getPath self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> GtkTreePathRecord.C.fromPtr true) getPath_ (self & iter)
    fun getStringFromIter self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> Utf8.C.fromPtr true) getStringFromIter_ (self & iter)
    fun getValue self iter column =
      let
        val value & () =
          (
            GtkTreeModelClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withPtr
             &&&> FFI.Int.C.withVal
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
            GtkTreeModelClass.C.withPtr
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
    fun iterHasChild self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterHasChild_ (self & iter)
    fun iterNChildren self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withOptPtr ---> FFI.Int.C.fromVal) iterNChildren_ (self & iter)
    fun iterNext self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterNext_ (self & iter)
    fun iterNthChild self parent n =
      let
        val iter & retVal =
          (
            GtkTreeModelClass.C.withPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             &&&> GtkTreeIterRecord.C.withOptPtr
             &&&> FFI.Int.C.withVal
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
            GtkTreeModelClass.C.withPtr
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
    fun iterPrevious self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) iterPrevious_ (self & iter)
    fun refNode self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) refNode_ (self & iter)
    fun rowChanged self path iter =
      (
        GtkTreeModelClass.C.withPtr
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
    fun rowDeleted self path = (GtkTreeModelClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) rowDeleted_ (self & path)
    fun rowHasChildToggled self path iter =
      (
        GtkTreeModelClass.C.withPtr
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
        GtkTreeModelClass.C.withPtr
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
    fun sortNewWithModel self = (GtkTreeModelClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr true) sortNewWithModel_ self
    fun unrefNode self iter = (GtkTreeModelClass.C.withPtr &&&> GtkTreeIterRecord.C.withPtr ---> I) unrefNode_ (self & iter)
    local
      open ClosureMarshal Signal
    in
      fun rowChangedSig f = signal "row-changed" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
      fun rowDeletedSig f = signal "row-deleted" (get 0w1 GtkTreePathRecord.t ---> ret_void) f
      fun rowHasChildToggledSig f = signal "row-has-child-toggled" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
      fun rowInsertedSig f = signal "row-inserted" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret_void) (fn path & iter => f path iter)
    end
  end
