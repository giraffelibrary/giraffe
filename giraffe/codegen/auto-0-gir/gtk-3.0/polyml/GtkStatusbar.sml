structure GtkStatusbar :>
  GTK_STATUSBAR
    where type 'a class = 'a GtkStatusbarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type 'a box_class = 'a GtkBoxClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_statusbar_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_statusbar_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getContextId_ = call (getSymbol "gtk_statusbar_get_context_id") (GtkStatusbarClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GUInt.PolyML.cVal)
      val getMessageArea_ = call (getSymbol "gtk_statusbar_get_message_area") (GtkStatusbarClass.PolyML.cPtr --> GtkBoxClass.PolyML.cPtr)
      val pop_ = call (getSymbol "gtk_statusbar_pop") (GtkStatusbarClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val push_ =
        call (getSymbol "gtk_statusbar_push")
          (
            GtkStatusbarClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GUInt.PolyML.cVal
          )
      val remove_ =
        call (getSymbol "gtk_statusbar_remove")
          (
            GtkStatusbarClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> cVoid
          )
      val removeAll_ = call (getSymbol "gtk_statusbar_remove_all") (GtkStatusbarClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkStatusbarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type 'a box_class = 'a GtkBoxClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStatusbarClass.FFI.fromPtr false) new_ ()
    fun getContextId self contextDescription = (GtkStatusbarClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GUInt.FFI.fromVal) getContextId_ (self & contextDescription)
    fun getMessageArea self = (GtkStatusbarClass.FFI.withPtr ---> GtkBoxClass.FFI.fromPtr false) getMessageArea_ self
    fun pop self contextId = (GtkStatusbarClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) pop_ (self & contextId)
    fun push self (contextId, text) =
      (
        GtkStatusbarClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> GUInt.FFI.fromVal
      )
        push_
        (
          self
           & contextId
           & text
        )
    fun remove self (contextId, messageId) =
      (
        GtkStatusbarClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        remove_
        (
          self
           & contextId
           & messageId
        )
    fun removeAll self contextId = (GtkStatusbarClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) removeAll_ (self & contextId)
    local
      open ClosureMarshal Signal
    in
      fun textPoppedSig f = signal "text-popped" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f (contextId, text))
      fun textPushedSig f = signal "text-pushed" (get 0w1 uint &&&> get 0w2 string ---> ret_void) (fn contextId & text => f (contextId, text))
    end
  end
