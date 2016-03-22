structure GtkStatusbar :>
  GTK_STATUSBAR
    where type 'a class = 'a GtkStatusbarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_statusbar_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_statusbar_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getContextId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_statusbar_get_context_id" :
              GtkStatusbarClass.C.notnull GtkStatusbarClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getMessageArea_ = _import "gtk_statusbar_get_message_area" : GtkStatusbarClass.C.notnull GtkStatusbarClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val pop_ = fn x1 & x2 => (_import "gtk_statusbar_pop" : GtkStatusbarClass.C.notnull GtkStatusbarClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val push_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_statusbar_push" :
              GtkStatusbarClass.C.notnull GtkStatusbarClass.C.p
               * FFI.UInt.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val remove_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_statusbar_remove" :
              GtkStatusbarClass.C.notnull GtkStatusbarClass.C.p
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeAll_ = fn x1 & x2 => (_import "gtk_statusbar_remove_all" : GtkStatusbarClass.C.notnull GtkStatusbarClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkStatusbarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStatusbarClass.C.fromPtr false) new_ ()
    fun getContextId self contextDescription = (GtkStatusbarClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.UInt.C.fromVal) getContextId_ (self & contextDescription)
    fun getMessageArea self = (GtkStatusbarClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMessageArea_ self
    fun pop self contextId = (GtkStatusbarClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) pop_ (self & contextId)
    fun push self contextId text =
      (
        GtkStatusbarClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> Utf8.C.withPtr
         ---> FFI.UInt.C.fromVal
      )
        push_
        (
          self
           & contextId
           & text
        )
    fun remove self contextId messageId =
      (
        GtkStatusbarClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        remove_
        (
          self
           & contextId
           & messageId
        )
    fun removeAll self contextId = (GtkStatusbarClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) removeAll_ (self & contextId)
    local
      open ClosureMarshal Signal
    in
      fun textPoppedSig f = signal "text-popped" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f contextId text)
      fun textPushedSig f = signal "text-pushed" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f contextId text)
    end
  end
