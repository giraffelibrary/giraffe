/* Copyright (C) 2012, 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Vte C interface support for Poly/ML
 */

#include <vte/vte.h>


/* VteTerminal */

gboolean
giraffe_vte_terminal_fork_command_full (VteTerminal *terminal,
                                        VtePtyFlags pty_flags,
                                        const char *working_directory,
                                        char **argv,
                                        char **envp,
                                        GSpawnFlags flags,
                                        GPid *child_pid,
                                        GError **error)
{
  return vte_terminal_fork_command_full (terminal,
                                         pty_flags,
                                         working_directory,
                                         argv,
                                         envp,
                                         flags,
                                         NULL,
                                         NULL,
                                         child_pid,
                                         error);
}
