structure GtkWidgetPath :>
  GTK_WIDGET_PATH
    where type t = GtkWidgetPathRecord.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type region_flags_t = GtkRegionFlags.t
    where type state_flags_t = GtkStateFlags.t =
  struct
    val getType_ = _import "gtk_widget_path_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_widget_path_new" : unit -> GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p;
    val appendForWidget_ = fn x1 & x2 => (_import "gtk_widget_path_append_for_widget" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val appendWithSiblings_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_append_with_siblings" :
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GUInt.FFI.val_
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val copy_ = _import "gtk_widget_path_copy" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p -> GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p;
    val iterAddClass_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_add_class" :
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkRegionFlags.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val iterClearClasses_ = fn x1 & x2 => (_import "gtk_widget_path_iter_clear_classes" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val iterClearRegions_ = fn x1 & x2 => (_import "gtk_widget_path_iter_clear_regions" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val iterGetName_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_name" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val iterGetObjectName_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_object_name" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val iterGetSiblingIndex_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_sibling_index" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> GUInt.FFI.val_;) (x1, x2)
    val iterGetSiblings_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_siblings" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p;) (x1, x2)
    val iterGetState_ = fn x1 & x2 => (_import "gtk_widget_path_iter_get_state" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p * GInt.FFI.val_ -> GtkStateFlags.FFI.val_;) (x1, x2)
    val iterHasClass_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_has_class" :
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
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
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
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
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * GLibQuark.FFI.val_
               -> GBool.FFI.val_;
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
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * GLibQuark.FFI.val_
               -> GBool.FFI.val_;
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
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * GLibQuark.FFI.val_
               * GtkRegionFlags.FFI.ref_
               -> GBool.FFI.val_;
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
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkRegionFlags.FFI.ref_
               -> GBool.FFI.val_;
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
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterSetObjectName_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_path_iter_set_object_name" :
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterSetState_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_path_iter_set_state" :
              GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p
               * GInt.FFI.val_
               * GtkStateFlags.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val length_ = _import "gtk_widget_path_length" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p -> GInt.FFI.val_;
    val toString_ = _import "gtk_widget_path_to_string" : GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    type t = GtkWidgetPathRecord.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type region_flags_t = GtkRegionFlags.t
    type state_flags_t = GtkStateFlags.t
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
    fun iterGetObjectName self pos = (GtkWidgetPathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) iterGetObjectName_ (self & pos)
    fun iterGetSiblingIndex self pos = (GtkWidgetPathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GUInt.FFI.fromVal) iterGetSiblingIndex_ (self & pos)
    fun iterGetSiblings self pos = (GtkWidgetPathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GtkWidgetPathRecord.FFI.fromPtr false) iterGetSiblings_ (self & pos)
    fun iterGetState self pos = (GtkWidgetPathRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GtkStateFlags.FFI.fromVal) iterGetState_ (self & pos)
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
    fun iterSetObjectName self (pos, name) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        iterSetObjectName_
        (
          self
           & pos
           & name
        )
    fun iterSetState self (pos, state) =
      (
        GtkWidgetPathRecord.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GtkStateFlags.FFI.withVal
         ---> I
      )
        iterSetState_
        (
          self
           & pos
           & state
        )
    fun length self = (GtkWidgetPathRecord.FFI.withPtr ---> GInt.FFI.fromVal) length_ self
    fun toString self = (GtkWidgetPathRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
