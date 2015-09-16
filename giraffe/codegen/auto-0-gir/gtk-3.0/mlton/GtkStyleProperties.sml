structure GtkStyleProperties :>
  GTK_STYLE_PROPERTIES
    where type 'a class_t = 'a GtkStylePropertiesClass.t
    where type 'a style_provider_class_t = 'a GtkStyleProviderClass.t
    where type symbolic_color_record_t = GtkSymbolicColorRecord.t
    where type state_flags_t = GtkStateFlags.t =
  struct
    val getType_ = _import "gtk_style_properties_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_style_properties_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val clear_ = _import "gtk_style_properties_clear" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val lookupColor_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_properties_lookup_color" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val mapColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_properties_map_color" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GtkSymbolicColorRecord.C.notnull GtkSymbolicColorRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val merge_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_properties_merge" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setProperty_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_style_properties_set_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GtkStateFlags.C.val_
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val unsetProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_properties_unset_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GtkStateFlags.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GtkStylePropertiesClass.t
    type 'a style_provider_class_t = 'a GtkStyleProviderClass.t
    type symbolic_color_record_t = GtkSymbolicColorRecord.t
    type state_flags_t = GtkStateFlags.t
    type t = base class_t
    fun asStyleProvider self = (GObjectObjectClass.C.withPtr ---> GtkStyleProviderClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStylePropertiesClass.C.fromPtr true) new_ ()
    fun clear self = (GObjectObjectClass.C.withPtr ---> I) clear_ self
    fun lookupColor self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GtkSymbolicColorRecord.C.fromPtr false) lookupColor_ (self & name)
    fun mapColor self name color =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GtkSymbolicColorRecord.C.withPtr
         ---> I
      )
        mapColor_
        (
          self
           & name
           & color
        )
    fun merge self propsToMerge replace =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        merge_
        (
          self
           & propsToMerge
           & replace
        )
    fun setProperty self property state value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GtkStateFlags.C.withVal
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        setProperty_
        (
          self
           & property
           & state
           & value
        )
    fun unsetProperty self property state =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GtkStateFlags.C.withVal
         ---> I
      )
        unsetProperty_
        (
          self
           & property
           & state
        )
  end
