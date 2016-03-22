structure GtkStyleProperties :>
  GTK_STYLE_PROPERTIES
    where type 'a class = 'a GtkStylePropertiesClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class
    where type symbolic_color_t = GtkSymbolicColorRecord.t
    where type state_flags_t = GtkStateFlags.t =
  struct
    val getType_ = _import "gtk_style_properties_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_style_properties_new" : unit -> GtkStylePropertiesClass.C.notnull GtkStylePropertiesClass.C.p;
    val clear_ = _import "gtk_style_properties_clear" : GtkStylePropertiesClass.C.notnull GtkStylePropertiesClass.C.p -> unit;
    val lookupColor_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_properties_lookup_color" :
              GtkStylePropertiesClass.C.notnull GtkStylePropertiesClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkStylePropertiesClass.C.notnull GtkStylePropertiesClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkStylePropertiesClass.C.notnull GtkStylePropertiesClass.C.p
               * GtkStylePropertiesClass.C.notnull GtkStylePropertiesClass.C.p
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
              GtkStylePropertiesClass.C.notnull GtkStylePropertiesClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkStylePropertiesClass.C.notnull GtkStylePropertiesClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkStateFlags.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GtkStylePropertiesClass.class
    type 'a style_provider_class = 'a GtkStyleProviderClass.class
    type symbolic_color_t = GtkSymbolicColorRecord.t
    type state_flags_t = GtkStateFlags.t
    type t = base class
    fun asStyleProvider self = (GObjectObjectClass.C.withPtr ---> GtkStyleProviderClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStylePropertiesClass.C.fromPtr true) new_ ()
    fun clear self = (GtkStylePropertiesClass.C.withPtr ---> I) clear_ self
    fun lookupColor self name = (GtkStylePropertiesClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkSymbolicColorRecord.C.fromPtr false) lookupColor_ (self & name)
    fun mapColor self name color =
      (
        GtkStylePropertiesClass.C.withPtr
         &&&> Utf8.C.withPtr
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
        GtkStylePropertiesClass.C.withPtr
         &&&> GtkStylePropertiesClass.C.withPtr
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
        GtkStylePropertiesClass.C.withPtr
         &&&> Utf8.C.withPtr
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
        GtkStylePropertiesClass.C.withPtr
         &&&> Utf8.C.withPtr
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
