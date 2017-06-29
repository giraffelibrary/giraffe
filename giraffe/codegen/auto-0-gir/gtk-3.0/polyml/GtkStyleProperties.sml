structure GtkStyleProperties :>
  GTK_STYLE_PROPERTIES
    where type 'a class = 'a GtkStylePropertiesClass.class
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class
    where type symbolic_color_t = GtkSymbolicColorRecord.t
    where type state_flags_t = GtkStateFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_style_properties_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_style_properties_new") (PolyMLFFI.cVoid --> GtkStylePropertiesClass.PolyML.cPtr)
      val clear_ = call (getSymbol "gtk_style_properties_clear") (GtkStylePropertiesClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val lookupColor_ = call (getSymbol "gtk_style_properties_lookup_color") (GtkStylePropertiesClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkSymbolicColorRecord.PolyML.cPtr)
      val mapColor_ =
        call (getSymbol "gtk_style_properties_map_color")
          (
            GtkStylePropertiesClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkSymbolicColorRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val merge_ =
        call (getSymbol "gtk_style_properties_merge")
          (
            GtkStylePropertiesClass.PolyML.cPtr
             &&> GtkStylePropertiesClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setProperty_ =
        call (getSymbol "gtk_style_properties_set_property")
          (
            GtkStylePropertiesClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GObjectValueRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val unsetProperty_ =
        call (getSymbol "gtk_style_properties_unset_property")
          (
            GtkStylePropertiesClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkStateFlags.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
    end
    type 'a class = 'a GtkStylePropertiesClass.class
    type 'a style_provider_class = 'a GtkStyleProviderClass.class
    type symbolic_color_t = GtkSymbolicColorRecord.t
    type state_flags_t = GtkStateFlags.t
    type t = base class
    fun asStyleProvider self = (GObjectObjectClass.FFI.withPtr ---> GtkStyleProviderClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStylePropertiesClass.FFI.fromPtr true) new_ ()
    fun clear self = (GtkStylePropertiesClass.FFI.withPtr ---> I) clear_ self
    fun lookupColor self name = (GtkStylePropertiesClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkSymbolicColorRecord.FFI.fromPtr false) lookupColor_ (self & name)
    fun mapColor self name color =
      (
        GtkStylePropertiesClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkSymbolicColorRecord.FFI.withPtr
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
        GtkStylePropertiesClass.FFI.withPtr
         &&&> GtkStylePropertiesClass.FFI.withPtr
         &&&> GBool.FFI.withVal
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
        GtkStylePropertiesClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkStateFlags.FFI.withVal
         &&&> GObjectValueRecord.FFI.withPtr
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
        GtkStylePropertiesClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
