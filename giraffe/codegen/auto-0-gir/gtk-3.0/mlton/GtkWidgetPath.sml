structure GtkWidgetPath :>
  GTK_WIDGET_PATH
    where type record_t = GtkWidgetPathRecord.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type region_flags_t = GtkRegionFlags.t =
  struct
    val getType_ = _import "gtk_widget_path_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_widget_path_new" : unit -> GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p;
    val appendForWidget_ = fn x1 & x2 => (_import "gtk_widget_path_append_for_widget" : GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val appendWithSiblings_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_append_with_siblings" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.UInt.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val copy_ = _import "gtk_widget_path_copy" : GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p -> GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p;
    val iterAddClass_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_add_class" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterAddRegion_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_widget_path_iter_add_region" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkRegionFlags.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val iterClearClasses_ = fn x1 & x2 => (_import "gtk_widget_path_iter_clear_classes" : GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val iterClearRegions_ = fn x1 & x2 => (_import "gtk_widget_path_iter_clear_regions" : GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val iterGetName_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_name" : GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p * FFI.Int.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val iterGetSiblingIndex_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_sibling_index" : GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p * FFI.Int.C.val_ -> FFI.UInt.C.val_;) (x1, x2)
    val iterGetSiblings_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_siblings" : GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p * FFI.Int.C.val_ -> GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p;) (x1, x2)
    val iterHasClass_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_has_class" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterHasName_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_has_name" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterHasQclass_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_iter_has_qclass" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * GLibQuark.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterHasQname_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_iter_has_qname" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * GLibQuark.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val iterHasQregion_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_widget_path_iter_has_qregion" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * GLibQuark.C.val_
               * GtkRegionFlags.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterHasRegion_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_widget_path_iter_has_region" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkRegionFlags.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val iterRemoveClass_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_remove_class" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterRemoveRegion_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_remove_region" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterSetName_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_set_name" :
              GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val length_ = _import "gtk_widget_path_length" : GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p -> FFI.Int.C.val_;
    val toString_ = _import "gtk_widget_path_to_string" : GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type record_t = GtkWidgetPathRecord.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type region_flags_t = GtkRegionFlags.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkWidgetPathRecord.C.fromPtr true) new_ ()
    fun appendForWidget self widget = (GtkWidgetPathRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) appendForWidget_ (self & widget)
    fun appendWithSiblings self siblings siblingIndex =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> GtkWidgetPathRecord.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> FFI.Int.C.fromVal
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
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
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
    fun iterClearClasses self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) iterClearClasses_ (self & pos)
    fun iterClearRegions self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) iterClearRegions_ (self & pos)
    fun iterGetName self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) iterGetName_ (self & pos)
    fun iterGetSiblingIndex self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.UInt.C.fromVal) iterGetSiblingIndex_ (self & pos)
    fun iterGetSiblings self pos = (GtkWidgetPathRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GtkWidgetPathRecord.C.fromPtr false) iterGetSiblings_ (self & pos)
    fun iterHasClass self pos name =
      (
        GtkWidgetPathRecord.C.withPtr
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> GLibQuark.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> GLibQuark.C.withVal
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
             &&&> FFI.Int.C.withVal
             &&&> GLibQuark.C.withVal
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
             &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
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
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         ---> I
      )
        iterSetName_
        (
          self
           & pos
           & name
        )
    fun length self = (GtkWidgetPathRecord.C.withPtr ---> FFI.Int.C.fromVal) length_ self
    fun toString self = (GtkWidgetPathRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
