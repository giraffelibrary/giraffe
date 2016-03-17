structure GtkBuildable :>
  GTK_BUILDABLE
    where type 'a class = 'a GtkBuildableClass.class
    where type 'a builder_class = 'a GtkBuilderClass.class =
  struct
    val getType_ = _import "gtk_buildable_get_type" : unit -> GObjectType.C.val_;
    val addChild_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5) =>
          (
            _import "mlton_gtk_buildable_add_child" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val constructChild_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_buildable_construct_child" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getInternalChild_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_buildable_get_internal_child" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getName_ = _import "gtk_buildable_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val parserFinished_ = fn x1 & x2 => (_import "gtk_buildable_parser_finished" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setBuildableProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_buildable_set_buildable_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_buildable_set_name" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkBuildableClass.class
    type 'a builder_class = 'a GtkBuilderClass.class
    type t = base class
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
