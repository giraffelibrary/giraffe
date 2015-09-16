signature GTK_PRINT_OPERATION_PREVIEW =
  sig
    type 'a class_t
    type 'a page_setup_class_t
    type 'a print_context_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val endPreview : 'a class_t -> unit
    val isSelected :
      'a class_t
       -> LargeInt.int
       -> bool
    val renderPage :
      'a class_t
       -> LargeInt.int
       -> unit
    val gotPageSizeSig :
      (base print_context_class_t
        -> base page_setup_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val readySig : (base print_context_class_t -> unit) -> 'a class_t Signal.signal
  end
