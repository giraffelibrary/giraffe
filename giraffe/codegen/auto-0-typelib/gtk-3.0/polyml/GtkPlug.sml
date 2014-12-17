structure GtkPlug :>
  GTK_PLUG
    where type 'a class_t = 'a GtkPlugClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_plug_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_plug_new") (FFI.UInt64.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val newForDisplay_ = call (load_sym libgtk "gtk_plug_new_for_display") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt64.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val construct_ = call (load_sym libgtk "gtk_plug_construct") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt64.PolyML.VAL --> FFI.PolyML.VOID)
      val constructForDisplay_ =
        call (load_sym libgtk "gtk_plug_construct_for_display")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt64.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getEmbedded_ = call (load_sym libgtk "gtk_plug_get_embedded") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getId_ = call (load_sym libgtk "gtk_plug_get_id") (GObjectObjectClass.PolyML.PTR --> FFI.UInt64.PolyML.VAL)
      val getSocketWindow_ = call (load_sym libgtk "gtk_plug_get_socket_window") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GtkPlugClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new socketId = (FFI.UInt64.C.withVal ---> GtkPlugClass.C.fromPtr false) new_ socketId
    fun newForDisplay display socketId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> GtkPlugClass.C.fromPtr false) newForDisplay_ (display & socketId)
    fun construct self socketId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) construct_ (self & socketId)
    fun constructForDisplay self display socketId =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        constructForDisplay_
        (
          self
           & display
           & socketId
        )
    fun getEmbedded self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getEmbedded_ self
    fun getId self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.C.fromVal) getId_ self
    fun getSocketWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getSocketWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun embeddedSig f = signal "embedded" (void ---> ret_void) f
    end
    local
      open Property
    in
      val embeddedProp = {get = fn x => get "embedded" boolean x}
      val socketWindowProp = {get = fn x => get "socket-window" GdkWindowClass.tOpt x}
    end
  end
