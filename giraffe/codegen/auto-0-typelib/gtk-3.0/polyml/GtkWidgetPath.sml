structure GtkWidgetPath :>
  GTK_WIDGET_PATH
    where type t = GtkWidgetPathRecord.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type region_flags_t = GtkRegionFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_widget_path_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_widget_path_new") (PolyMLFFI.cVoid --> GtkWidgetPathRecord.PolyML.cPtr)
      val appendForWidget_ = call (load_sym libgtk "gtk_widget_path_append_for_widget") (GtkWidgetPathRecord.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val appendWithSiblings_ =
        call (load_sym libgtk "gtk_widget_path_append_with_siblings")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val copy_ = call (load_sym libgtk "gtk_widget_path_copy") (GtkWidgetPathRecord.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val iterAddClass_ =
        call (load_sym libgtk "gtk_widget_path_iter_add_class")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val iterAddRegion_ =
        call (load_sym libgtk "gtk_widget_path_iter_add_region")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val iterClearClasses_ = call (load_sym libgtk "gtk_widget_path_iter_clear_classes") (GtkWidgetPathRecord.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val iterClearRegions_ = call (load_sym libgtk "gtk_widget_path_iter_clear_regions") (GtkWidgetPathRecord.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val iterGetName_ = call (load_sym libgtk "gtk_widget_path_iter_get_name") (GtkWidgetPathRecord.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val iterGetSiblingIndex_ = call (load_sym libgtk "gtk_widget_path_iter_get_sibling_index") (GtkWidgetPathRecord.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.UInt32.PolyML.cVal)
      val iterGetSiblings_ = call (load_sym libgtk "gtk_widget_path_iter_get_siblings") (GtkWidgetPathRecord.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> GtkWidgetPathRecord.PolyML.cPtr)
      val iterHasClass_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_class")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
      val iterHasName_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_name")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.Bool.PolyML.cVal
          )
      val iterHasQclass_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_qclass")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val iterHasQname_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_qname")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val iterHasQregion_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_qregion")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> GtkRegionFlags.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val iterHasRegion_ =
        call (load_sym libgtk "gtk_widget_path_iter_has_region")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val iterRemoveClass_ =
        call (load_sym libgtk "gtk_widget_path_iter_remove_class")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val iterRemoveRegion_ =
        call (load_sym libgtk "gtk_widget_path_iter_remove_region")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val iterSetName_ =
        call (load_sym libgtk "gtk_widget_path_iter_set_name")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val length_ = call (load_sym libgtk "gtk_widget_path_length") (GtkWidgetPathRecord.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val toString_ = call (load_sym libgtk "gtk_widget_path_to_string") (GtkWidgetPathRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type t = GtkWidgetPathRecord.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type region_flags_t = GtkRegionFlags.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkWidgetPathRecord.C.fromPtr true) new_ ()
    fun appendForWidget self widget = (GtkWidgetPathRecord.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Int32.C.fromVal) appendForWidget_ (self & widget)
    fun appendWithSiblings self siblings siblingIndex =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> GtkWidgetPathRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> FFI.Int32.C.fromVal
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
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
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
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
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
    fun iterClearClasses self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> I) iterClearClasses_ (self & pos)
    fun iterClearRegions self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> I) iterClearRegions_ (self & pos)
    fun iterGetName self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> Utf8.C.fromPtr false) iterGetName_ (self & pos)
    fun iterGetSiblingIndex self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.UInt32.C.fromVal) iterGetSiblingIndex_ (self & pos)
    fun iterGetSiblings self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GtkWidgetPathRecord.C.fromPtr false) iterGetSiblings_ (self & pos)
    fun iterHasClass self pos name =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
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
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> FFI.Bool.C.fromVal
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
         &&&> FFI.Int32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> FFI.Bool.C.fromVal
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
             &&&> FFI.Int32.C.withVal
             &&&> FFI.UInt32.C.withVal
             &&&> GtkRegionFlags.C.withRefVal
             ---> GtkRegionFlags.C.fromVal && FFI.Bool.C.fromVal
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
             &&&> FFI.Int32.C.withVal
             &&&> Utf8.C.withPtr
             &&&> GtkRegionFlags.C.withRefVal
             ---> GtkRegionFlags.C.fromVal && FFI.Bool.C.fromVal
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
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
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
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
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
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
         ---> I
      )
        iterSetName_
        (
          self
           & pos
           & name
        )
    fun length self = (GtkWidgetPathRecord.C.withPtr ---> FFI.Int32.C.fromVal) length_ self
    fun toString self = (GtkWidgetPathRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
