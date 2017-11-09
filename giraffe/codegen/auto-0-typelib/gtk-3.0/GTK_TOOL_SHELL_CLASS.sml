signature GTK_TOOL_SHELL_CLASS =
  sig
    type 'a tool_shell
    include
      CLASS
        where type 'a class = 'a tool_shell GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
