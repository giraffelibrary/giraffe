structure GtkBuildable :>
  GTK_BUILDABLE
    where type 'a class_t = 'a GtkBuildableClass.t
    where type 'a builder_class_t = 'a GtkBuilderClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_buildable_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val addChild_ =
        call (load_sym libgtk "gtk_buildable_add_child")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.PolyML.cVoid
          )
      val constructChild_ =
        call (load_sym libgtk "gtk_buildable_construct_child")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getInternalChild_ =
        call (load_sym libgtk "gtk_buildable_get_internal_child")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getName_ = call (load_sym libgtk "gtk_buildable_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val parserFinished_ = call (load_sym libgtk "gtk_buildable_parser_finished") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setBuildableProperty_ =
        call (load_sym libgtk "gtk_buildable_set_buildable_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val setName_ = call (load_sym libgtk "gtk_buildable_set_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkBuildableClass.t
    type 'a builder_class_t = 'a GtkBuilderClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addChild self builder child type' =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> GObjectObjectClass.C.fromPtr false
      )
        getInternalChild_
        (
          self
           & builder
           & childname
        )
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun parserFinished self builder = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) parserFinished_ (self & builder)
    fun setBuildableProperty self builder name value =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
  end
