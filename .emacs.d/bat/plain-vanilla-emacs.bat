REM  LM: batch di avvio di EMACS
REM
REM NB:
REM la variabile ambiente HOME definisce la direcotry dove Emacs cerca e scrive il file di configurazione (.emacs, .emacs.d/init.el etc)
REM il '%*' serve a passare al comando runemacs.exe eventuali parametri forniti all'avvio (da shell)
REM per indicare ad Emacs una "document root", la directory base in cui partire ad aprire il file (C-x C-f)
REM si deve usare il campo "Start in:" nello shortcut che rimanda al batch
REM NMB: indicare una path relativo per runemacs.exe, rende portabile la soluzione

D:
cd D:\home
set HOME=.\
C:\emacs\emacs-27.1-x86_64\bin\runemacs.exe -q %*