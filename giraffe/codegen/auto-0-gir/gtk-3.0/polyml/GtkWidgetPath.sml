structure GtkWidgetPath :>
  GTK_WIDGET_PATH
    where type t = GtkWidgetPathRecord.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type region_flags_t = GtkRegionFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_widget_path_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_widget_path_new") (cVoid --> GtkWidgetPathRecord.PolyML.cPtr)
      val appendForWidget_ = call (getSymbol "gtk_widget_path_append_for_widget") (GtkWidgetPathRecord.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val appendWithSiblings_ =
        call (getSymbol "gtk_widget_path_append_with_siblings")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GtkWidgetPathRecord.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val copy_ = call (getSymbol "gtk_widget_path_copy") (GtkWidgetPathRecord.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val iterAddClass_ =
        call (getSymbol "gtk_widget_path_iter_add_class")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val iterAddRegion_ =
        call (getSymbol "gtk_widget_path_iter_add_region")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cVal
             --> cVoid
          )
      val iterClearClasses_ = call (getSymbol "gtk_widget_path_iter_clear_classes") (GtkWidgetPathRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val iterClearRegions_ = call (getSymbol "gtk_widget_path_iter_clear_regions") (GtkWidgetPathRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val iterGetName_ = call (getSymbol "gtk_widget_path_iter_get_name") (GtkWidgetPathRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val iterGetSiblingIndex_ = call (getSymbol "gtk_widget_path_iter_get_sibling_index") (GtkWidgetPathRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GUInt.PolyML.cVal)
      val iterGetSiblings_ = call (getSymbol "gtk_widget_path_iter_get_siblings") (GtkWidgetPathRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GtkWidgetPathRecord.PolyML.cPtr)
      val iterHasClass_ =
        call (getSymbol "gtk_widget_path_iter_has_class")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val iterHasName_ =
        call (getSymbol "gtk_widget_path_iter_has_name")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GBool.PolyML.cVal
          )
      val iterHasQclass_ =
        call (getSymbol "gtk_widget_path_iter_has_qclass")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibQuark.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val iterHasQname_ =
        call (getSymbol "gtk_widget_path_iter_has_qname")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibQuark.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val iterHasQregion_ =
        call (getSymbol "gtk_widget_path_iter_has_qregion")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibQuark.PolyML.cVal
             &&> GtkRegionFlags.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val iterHasRegion_ =
        call (getSymbol "gtk_widget_path_iter_has_region")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val iterRemoveClass_ =
        call (getSymbol "gtk_widget_path_iter_remove_class")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val iterRemoveRegion_ =
        call (getSymbol "gtk_widget_path_iter_remove_region")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val iterSetName_ =
        call (getSymbol "gtk_widget_path_iter_set_name")
          (
            GtkWidgetPathRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val length_ = call (getSymbol "gtk_widget_path_length") (GtkWidgetPathRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val toString_ = call (getSymbol "gtk_widget_path_to_string") (GtkWidgetPathRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type t = GtkWidgetPathRecord.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type region_flags_t = GtkRegionFlags.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkWidgetPathRecord.FFI.fromPtr true) new_ ()
    fun appendForWidget self widget = (GtkWidgetPathRecord.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GInt.FFI.fromVal) appendForWidget_ (self & widget)
    fun appendWithSiblings self (siblings, siblingIndex) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GtkWidgetPathRecord.FFI.withPtr
         &&&> GUInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        appendWithSiblings_
        (
          self
           & siblings
           & siblingIndex
        )
    fun copy self = (GtkWidgetPathRecord.FFI.withPtr ---> GtkWidgetPathRecord.FFI.fromPtr true) copy_ self
    fun iterAddClass self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        iterAddClass_
        (
          self
           & pos
           & name
        )
    fun iterAddRegion
      self
      (
        pos,
        name,
        flags
      ) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         &&&> GtkRegionFlags.FFI.withVal
         ---> I
      )
        iterAddRegion_
        (
          self
           & pos
           & name
           & flags
        )
    fun iterClearClasses self pos = (GtkWidgetPathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) iterClearClasses_ (self & pos)
    fun iterClearRegions self pos = (GtkWidgetPathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) iterClearRegions_ (self & pos)
    fun iterGetName self pos = (GtkWidgetPathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) iterGetName_ (self & pos)
    fun iterGetSiblingIndex self pos = (GtkWidgetPathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GUInt.FFI.fromVal) iterGetSiblingIndex_ (self & pos)
    fun iterGetSiblings self pos = (GtkWidgetPathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GtkWidgetPathRecord.FFI.fromPtr false) iterGetSiblings_ (self & pos)
    fun iterHasClass self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        iterHasClass_
        (
          self
           & pos
           & name
        )
    fun iterHasName self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        iterHasName_
        (
          self
           & pos
           & name
        )
    fun iterHasQclass self (pos, qname) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GLibQuark.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        iterHasQclass_
        (
          self
           & pos
           & qname
        )
    fun iterHasQname self (pos, qname) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GLibQuark.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        iterHasQname_
        (
          self
           & pos
           & qname
        )
    fun iterHasQregion self (pos, qname) =
      let
        val flags & retVal =
          (
            GtkWidgetPathRecord.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GLibQuark.FFI.withVal
             &&&> GtkRegionFlags.FFI.withRefVal
             ---> GtkRegionFlags.FFI.fromVal && GBool.FFI.fromVal
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
    fun iterHasRegion self (pos, name) =
      let
        val flags & retVal =
          (
            GtkWidgetPathRecord.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> Utf8.FFI.withPtr
             &&&> GtkRegionFlags.FFI.withRefVal
             ---> GtkRegionFlags.FFI.fromVal && GBool.FFI.fromVal
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
    fun iterRemoveClass self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        iterRemoveClass_
        (
          self
           & pos
           & name
        )
    fun iterRemoveRegion self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        iterRemoveRegion_
        (
          self
           & pos
           & name
        )
    fun iterSetName self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        iterSetName_
        (
          self
           & pos
           & name
        )
    fun length self = (GtkWidgetPathRecord.FFI.withPtr ---> GInt.FFI.fromVal) length_ self
    fun toString self = (GtkWidgetPathRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
