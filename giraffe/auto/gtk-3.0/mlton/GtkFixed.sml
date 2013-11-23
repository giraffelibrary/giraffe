structure GtkFixed :>
  GTK_FIXED
    where type 'a class_t = 'a GtkFixedClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_fixed_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_fixed_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val move_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_fixed_move" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val put_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_fixed_put" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class_t = 'a GtkFixedClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFixedClass.C.fromPtr false) new_ ()
    fun move self widget x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        move_
        (
          self
           & widget
           & x
           & y
        )
    fun put self widget x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        put_
        (
          self
           & widget
           & x
           & y
        )
  end
