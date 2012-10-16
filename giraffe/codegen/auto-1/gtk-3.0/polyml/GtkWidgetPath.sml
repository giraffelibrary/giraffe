structure GtkWidgetPath :>
  GTK_WIDGET_PATH
    where type record_t = GtkWidgetPathRecord.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type regionflags_t = GtkRegionFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_widget_path_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_widget_path_new") (FFI.PolyML.VOID --> GtkWidgetPathRecord.PolyML.PTR)
      val appendForWidget_ = call (load_sym libgtk "gtk_widget_path_append_for_widget") (GtkWidgetPathRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val appendWithSiblings_ =
        call (load_sym libgtk "gtk_widget_path_append_with_siblings")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.Int32.VAL
          )
      val copy_ = call (load_sym libgtk "gtk_widget_path_copy") (GtkWidgetPathRecord.PolyML.PTR --> GtkWidgetPathRecord.PolyML.PTR)
      val iterAddClass_ =
        call (load_sym libgtk "gtk_widget_path_iter_add_class")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val iterAddRegion_ =
        call (load_sym libgtk "gtk_widget_path_iter_add_region")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> GtkRegionFlags.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val iterClearClasses_ = call (load_sym libgtk "gtk_widget_path_iter_clear_classes") (GtkWidgetPathRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val iterClearRegions_ = call (load_sym libgtk "gtk_widget_path_iter_clear_regions") (GtkWidgetPathRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val iterGetName_ = call (load_sym libgtk "gtk_widget_path_iter_get_name") (GtkWidgetPathRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.String.RETPTR)
      val iterGetSiblingIndex_ = call (load_sym libgtk "gtk_widget_path_iter_get_sibling_index") (GtkWidgetPathRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Word32.VAL)
      val iterGetSiblings_ = call (load_sym libgtk "gtk_widget_path_iter_get_siblings") (GtkWidgetPathRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GtkWidgetPathRecord.PolyML.PTR)
      val iterHasClass_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_class")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.Bool.VAL
          )
      val iterHasName_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_name")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.Bool.VAL
          )
      val iterHasQclass_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_qclass")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val iterHasQname_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_qname")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Word32.VAL
             --> FFI.PolyML.Bool.VAL
          )
      val iterHasQregion_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_qregion")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Word32.VAL
             &&> GtkRegionFlags.PolyML.REF
             --> FFI.PolyML.Bool.VAL
          )
      val iterHasRegion_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_region")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             &&> GtkRegionFlags.PolyML.REF
             --> FFI.PolyML.Bool.VAL
          )
      val iterRemoveClass_ =
        call (load_sym libgtk "gtk_widget_path_iter_remove_class")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val iterRemoveRegion_ =
        call (load_sym libgtk "gtk_widget_path_iter_remove_region")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val iterSetName_ =
        call (load_sym libgtk "gtk_widget_path_iter_set_name")
          (
            GtkWidgetPathRecord.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val length_ = call (load_sym libgtk "gtk_widget_path_length") (GtkWidgetPathRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val toString_ = call (load_sym libgtk "gtk_widget_path_to_string") (GtkWidgetPathRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
    end
    type record_t = GtkWidgetPathRecord.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type regionflags_t = GtkRegionFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkWidgetPathRecord.C.fromPtr true) new_ ()
    fun appendForWidget self widget = (GtkWidgetPathRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) appendForWidget_ (self & widget)
    fun appendWithSiblings self siblings siblingIndex =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Word32.withVal
         ---> FFI.Int32.fromVal
      )
        appendWithSiblings_
        (
          self
           & siblings
           & siblingIndex
        )
    fun copy self = (GtkWidgetPathRecord.C.withPtr ---> GtkWidgetPathRecord.C.fromPtr true) copy_ self
    fun iterAddClass self pos name =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         ---> I
      )
        iterAddClass_
        (
          self
           & pos
           & name
        )
    fun iterAddRegion self pos name flags =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         &&&> GtkRegionFlags.C.withVal
         ---> I
      )
        iterAddRegion_
        (
          self
           & pos
           & name
           & flags
        )
    fun iterClearClasses self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) iterClearClasses_ (self & pos)
    fun iterClearRegions self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) iterClearRegions_ (self & pos)
    fun iterGetName self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr false) iterGetName_ (self & pos)
    fun iterGetSiblingIndex self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Word32.fromVal) iterGetSiblingIndex_ (self & pos)
    fun iterGetSiblings self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.withVal ---> GtkWidgetPathRecord.C.fromPtr false) iterGetSiblings_ (self & pos)
    fun iterHasClass self pos name =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         ---> FFI.Bool.fromVal
      )
        iterHasClass_
        (
          self
           & pos
           & name
        )
    fun iterHasName self pos name =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         ---> FFI.Bool.fromVal
      )
        iterHasName_
        (
          self
           & pos
           & name
        )
    fun iterHasQclass self pos qname =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Word32.withVal
         ---> FFI.Bool.fromVal
      )
        iterHasQclass_
        (
          self
           & pos
           & qname
        )
    fun iterHasQname self pos qname =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Word32.withVal
         ---> FFI.Bool.fromVal
      )
        iterHasQname_
        (
          self
           & pos
           & qname
        )
    fun iterHasQregion self pos qname =
      let
        val flags & retVal =
          (
            GtkWidgetPathRecord.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Word32.withVal
             &&&> GtkRegionFlags.C.withRefVal
             ---> GtkRegionFlags.C.fromVal && FFI.Bool.fromVal
          )
            iterHasQregion_
            (
              self
               & pos
               & qname
               & GtkRegionFlags.flags []
            )
      in
        if retVal then SOME flags else NONE
      end
    fun iterHasRegion self pos name =
      let
        val flags & retVal =
          (
            GtkWidgetPathRecord.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.String.withConstPtr
             &&&> GtkRegionFlags.C.withRefVal
             ---> GtkRegionFlags.C.fromVal && FFI.Bool.fromVal
          )
            iterHasRegion_
            (
              self
               & pos
               & name
               & GtkRegionFlags.flags []
            )
      in
        if retVal then SOME flags else NONE
      end
    fun iterRemoveClass self pos name =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         ---> I
      )
        iterRemoveClass_
        (
          self
           & pos
           & name
        )
    fun iterRemoveRegion self pos name =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         ---> I
      )
        iterRemoveRegion_
        (
          self
           & pos
           & name
        )
    fun iterSetName self pos name =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         ---> I
      )
        iterSetName_
        (
          self
           & pos
           & name
        )
    fun length self = (GtkWidgetPathRecord.C.withPtr ---> FFI.Int32.fromVal) length_ self
    fun toString self = (GtkWidgetPathRecord.C.withPtr ---> FFI.String.fromPtr true) toString_ self
  end
