structure GtkFixed :>
  GTK_FIXED
    where type 'a class = 'a GtkFixedClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_fixed_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_fixed_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val move_ =
        call (getSymbol "gtk_fixed_move")
          (
            GtkFixedClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val put_ =
        call (getSymbol "gtk_fixed_put")
          (
            GtkFixedClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkFixedClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFixedClass.FFI.fromPtr false) new_ ()
    fun move
      self
      (
        widget,
        x,
        y
      ) =
      (
        GtkFixedClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        move_
        (
          self
           & widget
           & x
           & y
        )
    fun put
      self
      (
        widget,
        x,
        y
      ) =
      (
        GtkFixedClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
