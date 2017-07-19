structure GtkBuildable :>
  GTK_BUILDABLE
    where type 'a class = 'a GtkBuildableClass.class
    where type 'a builder_class = 'a GtkBuilderClass.class =
  struct
    val getType_ = _import "gtk_buildable_get_type" : unit -> GObjectType.FFI.val_;
    val addChild_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5) =>
          (
            _import "mlton_gtk_buildable_add_child" :
              GtkBuildableClass.FFI.notnull GtkBuildableClass.FFI.p
               * GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
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
              GtkBuildableClass.FFI.notnull GtkBuildableClass.FFI.p
               * GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
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
              GtkBuildableClass.FFI.notnull GtkBuildableClass.FFI.p
               * GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getName_ = _import "gtk_buildable_get_name" : GtkBuildableClass.FFI.notnull GtkBuildableClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val parserFinished_ = fn x1 & x2 => (_import "gtk_buildable_parser_finished" : GtkBuildableClass.FFI.notnull GtkBuildableClass.FFI.p * GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p -> unit;) (x1, x2)
    val setBuildableProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_buildable_set_buildable_property" :
              GtkBuildableClass.FFI.notnull GtkBuildableClass.FFI.p
               * GtkBuilderClass.FFI.notnull GtkBuilderClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
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
              GtkBuildableClass.FFI.notnull GtkBuildableClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addChild
      self
      (
        builder,
        child,
        type'
      ) =
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
    fun constructChild self (builder, name) =
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
    fun getInternalChild self (builder, childname) =
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
    fun setBuildableProperty
      self
      (
        builder,
        name,
        value
      ) =
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
