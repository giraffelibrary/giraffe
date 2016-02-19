structure GtkStyleProperties :>
  GTK_STYLE_PROPERTIES
    where type 'a class_t = 'a GtkStylePropertiesClass.t
    where type 'a style_provider_class_t = 'a GtkStyleProviderClass.t
    where type symbolic_color_record_t = GtkSymbolicColorRecord.t
    where type state_flags_t = GtkStateFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_style_properties_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_style_properties_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val clear_ = call (load_sym libgtk "gtk_style_properties_clear") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val lookupColor_ = call (load_sym libgtk "gtk_style_properties_lookup_color") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GtkSymbolicColorRecord.PolyML.PTR)
      val mapColor_ =
        call (load_sym libgtk "gtk_style_properties_map_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GtkSymbolicColorRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val merge_ =
        call (load_sym libgtk "gtk_style_properties_merge")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setProperty_ =
        call (load_sym libgtk "gtk_style_properties_set_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val unsetProperty_ =
        call (load_sym libgtk "gtk_style_properties_unset_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GtkStateFlags.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GtkStylePropertiesClass.t
    type 'a style_provider_class_t = 'a GtkStyleProviderClass.t
    type symbolic_color_record_t = GtkSymbolicColorRecord.t
    type state_flags_t = GtkStateFlags.t
    type t = base class_t
    fun asStyleProvider self = (GObjectObjectClass.C.withPtr ---> GtkStyleProviderClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStylePropertiesClass.C.fromPtr true) new_ ()
    fun clear self = (GObjectObjectClass.C.withPtr ---> I) clear_ self
    fun lookupColor self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkSymbolicColorRecord.C.fromPtr false) lookupColor_ (self & name)
    fun mapColor self name color =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
