val libc = CInterface.load_lib "libc.so.6";
fun use file =
  case OS.Path.splitDirFile file of
    {dir = "", file} => PolyML.use file
  | {dir, file}      =>
      let
        val curDir = OS.FileSys.getDir ()
      in
        (
          OS.FileSys.chDir dir;
          PolyML.use file;
          OS.FileSys.chDir curDir
        )
          handle
            e => (OS.FileSys.chDir curDir; raise e)
      end
;

use "general/polyml.sml";
use "ffi/polyml.sml";
use "auto/polyml.sml";
