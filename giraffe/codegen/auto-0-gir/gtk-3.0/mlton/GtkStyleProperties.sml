structure GtkStyleProperties :>
  GTK_STYLE_PROPERTIES
    where type 'a class = 'a GtkStylePropertiesClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class
    where type symbolic_color_t = GtkSymbolicColorRecord.t
    where type state_flags_t = GtkStateFlags.t =
  struct
    val getType_ = _import "gtk_style_properties_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_style_properties_new" : unit -> GtkStylePropertiesClass.FFI.non_opt GtkStylePropertiesClass.FFI.p;
    val clear_ = _import "gtk_style_properties_clear" : GtkStylePropertiesClass.FFI.non_opt GtkStylePropertiesClass.FFI.p -> unit;
    val lookupColor_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_properties_lookup_color" :
              GtkStylePropertiesClass.FFI.non_opt GtkStylePropertiesClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkSymbolicColorRecord.FFI.non_opt GtkSymbolicColorRecord.FFI.p;
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
              GtkStylePropertiesClass.FFI.non_opt GtkStylePropertiesClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkSymbolicColorRecord.FFI.non_opt GtkSymbolicColorRecord.FFI.p
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
              GtkStylePropertiesClass.FFI.non_opt GtkStylePropertiesClass.FFI.p
               * GtkStylePropertiesClass.FFI.non_opt GtkStylePropertiesClass.FFI.p
               * GBool.FFI.val_
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
              GtkStylePropertiesClass.FFI.non_opt GtkStylePropertiesClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkStateFlags.FFI.val_
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
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
              GtkStylePropertiesClass.FFI.non_opt GtkStylePropertiesClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkStateFlags.FFI.val_
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
    fun asStyleProvider self = (GObjectObjectClass.FFI.withPtr false ---> GtkStyleProviderClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStylePropertiesClass.FFI.fromPtr true) new_ ()
    fun clear self = (GtkStylePropertiesClass.FFI.withPtr false ---> I) clear_ self
    fun lookupColor self name = (GtkStylePropertiesClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkSymbolicColorRecord.FFI.fromPtr false) lookupColor_ (self & name) before GtkStylePropertiesClass.FFI.touchPtr self before Utf8.FFI.touchPtr name
    fun mapColor self (name, color) =
      (
        GtkStylePropertiesClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkSymbolicColorRecord.FFI.withPtr false
         ---> I
      )
        mapColor_
        (
          self
           & name
           & color
        )
    fun merge self (propsToMerge, replace) =
      (
        GtkStylePropertiesClass.FFI.withPtr false
         &&&> GtkStylePropertiesClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        merge_
        (
          self
           & propsToMerge
           & replace
        )
    fun setProperty
      self
      (
        property,
        state,
        value
      ) =
      (
        GtkStylePropertiesClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkStateFlags.FFI.withVal
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
      )
        setProperty_
        (
          self
           & property
           & state
           & value
        )
    fun unsetProperty self (property, state) =
      (
        GtkStylePropertiesClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkStateFlags.FFI.withVal
         ---> I
      )
        unsetProperty_
        (
          self
           & property
           & state
        )
  end
