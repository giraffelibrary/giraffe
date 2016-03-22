structure GtkFixed :>
  GTK_FIXED
    where type 'a class = 'a GtkFixedClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_fixed_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_fixed_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val move_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_fixed_move" :
              GtkFixedClass.C.notnull GtkFixedClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GtkFixedClass.C.notnull GtkFixedClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GtkFixedClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFixedClass.C.fromPtr false) new_ ()
    fun move self widget x y =
      (
        GtkFixedClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
        GtkFixedClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
