structure GtkStatusbar :>
  GTK_STATUSBAR
    where type 'a class_t = 'a GtkStatusbarClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a orientable_class_t = 'a GtkOrientableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_statusbar_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_statusbar_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getContextId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_statusbar_get_context_id" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> FFI.UInt.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getMessageArea_ = _import "gtk_statusbar_get_message_area" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val pop_ = fn x1 & x2 => (_import "gtk_statusbar_pop" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val push_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_statusbar_push" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt.C.val_
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeAll_ = fn x1 & x2 => (_import "gtk_statusbar_remove_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkStatusbarClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a orientable_class_t = 'a GtkOrientableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStatusbarClass.C.fromPtr false) new_ ()
    fun getContextId self contextDescription = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.UInt.C.fromVal) getContextId_ (self & contextDescription)
    fun getMessageArea self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMessageArea_ self
    fun pop self contextId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) pop_ (self & contextId)
    fun push self contextId text =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
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
    fun removeAll self contextId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) removeAll_ (self & contextId)
    local
      open ClosureMarshal Signal
    in
      fun textPoppedSig f = signal "text-popped" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f contextId text)
      fun textPushedSig f = signal "text-pushed" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f contextId text)
    end
  end
