signature VTE_PTY_CLASS =
  sig
    type 'a pty
    include
      CLASS
        where type 'a class = 'a pty GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
