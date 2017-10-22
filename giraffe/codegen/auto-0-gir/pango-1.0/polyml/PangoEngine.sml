structure PangoEngine :>
  PANGO_ENGINE
    where type 'a class = 'a PangoEngineClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_engine_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a PangoEngineClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
