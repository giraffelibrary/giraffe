structure GtkBuildable :>
  GTK_BUILDABLE
    where type 'a class_t = 'a GtkBuildableClass.t
    where type 'a builderclass_t = 'a GtkBuilderClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_buildable_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val addChild_ =
        call (load_sym libgtk "gtk_buildable_add_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INOPTPTR
             --> FFI.PolyML.VOID
          )
      val constructChild_ =
        call (load_sym libgtk "gtk_buildable_construct_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val customFinished_ =
        call (load_sym libgtk "gtk_buildable_custom_finished")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val customTagEnd_ =
        call (load_sym libgtk "gtk_buildable_custom_tag_end")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val getInternalChild_ =
        call (load_sym libgtk "gtk_buildable_get_internal_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             --> GObjectObjectClass.PolyML.PTR
          )
      val getName_ = call (load_sym libgtk "gtk_buildable_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val parserFinished_ = call (load_sym libgtk "gtk_buildable_parser_finished") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setBuildableProperty_ =
        call (load_sym libgtk "gtk_buildable_set_buildable_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val setName_ = call (load_sym libgtk "gtk_buildable_set_name") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkBuildableClass.t
    type 'a builderclass_t = 'a GtkBuilderClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun addChild self builder child type' =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstOptPtr
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
         &&&> FFI.String.withConstPtr
         ---> GObjectObjectClass.C.fromPtr true
      )
        constructChild_
        (
          self
           & builder
           & name
        )
    fun customFinished self builder child tagname =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.withConstPtr
         ---> I
      )
        customFinished_
        (
          self
           & builder
           & child
           & tagname
        )
    fun customTagEnd self builder child tagname =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.String.withConstPtr
         ---> I
      )
        customTagEnd_
        (
          self
           & builder
           & child
           & tagname
        )
    fun getInternalChild self builder childname =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         ---> GObjectObjectClass.C.fromPtr false
      )
        getInternalChild_
        (
          self
           & builder
           & childname
        )
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun parserFinished self builder = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) parserFinished_ (self & builder)
    fun setBuildableProperty self builder name value =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
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
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setName_ (self & name)
  end
