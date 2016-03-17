structure GtkTreeSortable :>
  GTK_TREE_SORTABLE
    where type 'a class = 'a GtkTreeSortableClass.class
    where type sort_type_t = GtkSortType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_sortable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getSortColumnId_ =
        call (load_sym libgtk "gtk_tree_sortable_get_sort_column_id")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> GtkSortType.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val hasDefaultSortFunc_ = call (load_sym libgtk "gtk_tree_sortable_has_default_sort_func") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setSortColumnId_ =
        call (load_sym libgtk "gtk_tree_sortable_set_sort_column_id")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GtkSortType.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val sortColumnChanged_ = call (load_sym libgtk "gtk_tree_sortable_sort_column_changed") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> GtkSortType.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && GtkSortType.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getSortColumnId_
            (
              self
               & FFI.Int.null
               & GtkSortType.null
            )
      in
        if retVal then SOME (sortColumnId, order) else NONE
      end
    fun hasDefaultSortFunc self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasDefaultSortFunc_ self
    fun setSortColumnId self sortColumnId order =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GtkSortType.C.withVal
         ---> I
      )
        setSortColumnId_
        (
          self
           & sortColumnId
           & order
        )
    fun sortColumnChanged self = (GObjectObjectClass.C.withPtr ---> I) sortColumnChanged_ self
    local
      open ClosureMarshal Signal
    in
      fun sortColumnChangedSig f = signal "sort-column-changed" (void ---> ret_void) f
    end
  end
