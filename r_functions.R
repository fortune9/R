# environment setup

load_pkg<-function(pkg)
{
   if(!require(pkg,character.only=T,warn.conflicts=F)) {
      install.packages(pkg, dependencies=T,repos="https://cloud.r-project.org");
      suppressMessages(library(pkg,character.only=T));
   }
}

self<-function()
{
        args<-commandArgs(F)
        path<-sub("^--file=",'',grep("^--file=", args, value=T))
}


# file processing

## get the filename extension
get_ext<-function(f)
{
        m<-regexec(".*\\.([^.]+)$",f)
        return(regmatches(f,m)[[1]][2])
}


# I/O

msg<-function(...)
{
        exe<-basename(self())
        cat(paste("[",exe,"]",sep=""),...,"\n",sep=" ")
}

## pause the running
pause<-function(...)
{
        if(interactive())
        {
                invisible(readline(...))
        }else
        {
                cat(...,"\n")
                invisible(readLines(file("stdin"),n=1))
        }
}


