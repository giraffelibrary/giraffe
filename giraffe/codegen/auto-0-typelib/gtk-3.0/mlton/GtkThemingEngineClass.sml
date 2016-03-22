structure GtkThemingEngineClass :>
  GTK_THEMING_ENGINE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a theming_engine = unit
    type 'a class = 'a theming_engine class
  end
