structure GtkBuildable :>
  GTK_BUILDABLE
    where type 'a class = 'a GtkBuildableClass.class
    where type 'a builder_class = 'a GtkBuilderClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_buildable_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val addChild_ =
        call (load_sym libgtk "gtk_buildable_add_child")
          (
            GtkBuildableClass.PolyML.cPtr
             &&> GtkBuilderClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> PolyMLFFI.cVoid
          )
      val constructChild_ =
        call (load_sym libgtk "gtk_buildable_construct_child")
          (
            GtkBuildableClass.PolyML.cPtr
             &&> GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getInternalChild_ =
        call (load_sym libgtk "gtk_buildable_get_internal_child")
          (
            GtkBuildableClass.PolyML.cPtr
             &&> GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getName_ = call (load_sym libgtk "gtk_buildable_get_name") (GtkBuildableClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val parserFinished_ = call (load_sym libgtk "gtk_buildable_parser_finished") (GtkBuildableClass.PolyML.cPtr &&> GtkBuilderClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setBuildableProperty_ =
        call (load_sym libgtk "gtk_buildable_set_buildable_property")
          (
            GtkBuildableClass.PolyML.cPtr
             &&> GtkBuilderClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val setName_ = call (load_sym libgtk "gtk_buildable_set_name") (GtkBuildableClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkBuildableClass.class
    type 'a builder_class = 'a GtkBuilderClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addChild self builder child type' =
      (
        GtkBuildableClass.C.withPtr
         &&&> GtkBuilderClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withOptPtr
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
        GtkBuildableClass.C.withPtr
         &&&> GtkBuilderClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GObjectObjectClass.C.fromPtr true
      )
        constructChild_
        (
          self
           & builder
           & name
        )
    fun getInternalChild self builder childname =
      (
        GtkBuildableClass.C.withPtr
         &&&> GtkBuilderClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GObjectObjectClass.C.fromPtr false
      )
        getInternalChild_
        (
          self
           & builder
           & childname
        )
    fun getName self = (GtkBuildableClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun parserFinished self builder = (GtkBuildableClass.C.withPtr &&&> GtkBuilderClass.C.withPtr ---> I) parserFinished_ (self & builder)
    fun setBuildableProperty self builder name value =
      (
        GtkBuildableClass.C.withPtr
         &&&> GtkBuilderClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        setBuildableProperty_
        (
          self
           & builder
           & name
           & value
        )
    fun setName self name = (GtkBuildableClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
  end
