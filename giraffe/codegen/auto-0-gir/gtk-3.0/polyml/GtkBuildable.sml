structure GtkBuildable :>
  GTK_BUILDABLE
    where type 'a class = 'a GtkBuildableClass.class
    where type 'a builder_class = 'a GtkBuilderClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_buildable_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addChild_ =
        call (getSymbol "gtk_buildable_add_child")
          (
            GtkBuildableClass.PolyML.cPtr
             &&> GtkBuilderClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val constructChild_ =
        call (getSymbol "gtk_buildable_construct_child")
          (
            GtkBuildableClass.PolyML.cPtr
             &&> GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getInternalChild_ =
        call (getSymbol "gtk_buildable_get_internal_child")
          (
            GtkBuildableClass.PolyML.cPtr
             &&> GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getName_ = call (getSymbol "gtk_buildable_get_name") (GtkBuildableClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val parserFinished_ = call (getSymbol "gtk_buildable_parser_finished") (GtkBuildableClass.PolyML.cPtr &&> GtkBuilderClass.PolyML.cPtr --> cVoid)
      val setBuildableProperty_ =
        call (getSymbol "gtk_buildable_set_buildable_property")
          (
            GtkBuildableClass.PolyML.cPtr
             &&> GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val setName_ = call (getSymbol "gtk_buildable_set_name") (GtkBuildableClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkBuildableClass.class
    type 'a builder_class = 'a GtkBuilderClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addChild self builder child type' =
      (
        GtkBuildableClass.FFI.withPtr
         &&&> GtkBuilderClass.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        addChild_
        (
          self
           & builder
           & child
           & type'
        )
    fun constructChild self builder name =
      (
        GtkBuildableClass.FFI.withPtr
         &&&> GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GObjectObjectClass.FFI.fromPtr true
      )
        constructChild_
        (
          self
           & builder
           & name
        )
    fun getInternalChild self builder childname =
      (
        GtkBuildableClass.FFI.withPtr
         &&&> GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GObjectObjectClass.FFI.fromPtr false
      )
        getInternalChild_
        (
          self
           & builder
           & childname
        )
    fun getName self = (GtkBuildableClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun parserFinished self builder = (GtkBuildableClass.FFI.withPtr &&&> GtkBuilderClass.FFI.withPtr ---> I) parserFinished_ (self & builder)
    fun setBuildableProperty self builder name value =
      (
        GtkBuildableClass.FFI.withPtr
         &&&> GtkBuilderClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        setBuildableProperty_
        (
          self
           & builder
           & name
           & value
        )
    fun setName self name = (GtkBuildableClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setName_ (self & name)
  end
