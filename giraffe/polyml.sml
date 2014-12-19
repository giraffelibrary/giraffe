(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

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
