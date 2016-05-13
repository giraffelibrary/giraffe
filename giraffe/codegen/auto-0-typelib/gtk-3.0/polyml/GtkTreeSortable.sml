structure GtkTreeSortable :>
  GTK_TREE_SORTABLE
    where type 'a class = 'a GtkTreeSortableClass.class
    where type sort_type_t = GtkSortType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_sortable_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getSortColumnId_ =
        call (load_sym libgtk "gtk_tree_sortable_get_sort_column_id")
          (
            GtkTreeSortableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> GtkSortType.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val hasDefaultSortFunc_ = call (load_sym libgtk "gtk_tree_sortable_has_default_sort_func") (GtkTreeSortableClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setSortColumnId_ =
        call (load_sym libgtk "gtk_tree_sortable_set_sort_column_id")
          (
            GtkTreeSortableClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> GtkSortType.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val sortColumnChanged_ = call (load_sym libgtk "gtk_tree_sortable_sort_column_changed") (GtkTreeSortableClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkTreeSortableClass.class
    type sort_type_t = GtkSortType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getSortColumnId self =
      let
        val sortColumnId
         & order
         & retVal =
          (
            GtkTreeSortableClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> GtkSortType.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && GtkSortType.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getSortColumnId_
            (
              self
               & FFI.Int32.null
               & GtkSortType.null
            )
      in
        if retVal then SOME (sortColumnId, order) else NONE
      end
    fun hasDefaultSortFunc self = (GtkTreeSortableClass.C.withPtr ---> FFI.Bool.C.fromVal) hasDefaultSortFunc_ self
    fun setSortColumnId self sortColumnId order =
      (
        GtkTreeSortableClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GtkSortType.C.withVal
         ---> I
      )
        setSortColumnId_
        (
          self
           & sortColumnId
           & order
        )
    fun sortColumnChanged self = (GtkTreeSortableClass.C.withPtr ---> I) sortColumnChanged_ self
    local
      open ClosureMarshal Signal
    in
      fun sortColumnChangedSig f = signal "sort-column-changed" (void ---> ret_void) f
    end
  end
