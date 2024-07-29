/******************************************************************************/
/* Important Spring 2024 CSCI 402 usage information:                          */
/*                                                                            */
/* This fils is part of CSCI 402 kernel programming assignments at USC.       */
/*         53616c7465645f5fd1e93dbf35cbffa3aef28f8c01d8cf2ffc51ef62b26a       */
/*         f9bda5a68e5ed8c972b17bab0f42e24b19daa7bd408305b1f7bd6c7208c1       */
/*         0e36230e913039b3046dd5fd0ba706a624d33dbaa4d6aab02c82fe09f561       */
/*         01b0fd977b0051f0b0ce0c69f7db857b1b5e007be2db6d42894bf93de848       */
/*         806d9152bd5715e9                                                   */
/* Please understand that you are NOT permitted to distribute or publically   */
/*         display a copy of this file (or ANY PART of it) for any reason.    */
/* If anyone (including your prospective employer) asks you to post the code, */
/*         you must inform them that you do NOT have permissions to do so.    */
/* You are also NOT permitted to remove or alter this comment block.          */
/* If this comment block is removed or altered in a submitted file, 20 points */
/*         will be deducted.                                                  */
/******************************************************************************/

/*
 *  FILE: vfs_syscall.c
 *  AUTH: mcc | jal
 *  DESC:
 *  DATE: Wed Apr  8 02:46:19 1998
 *  $Id: vfs_syscall.c,v 1.2 2018/05/27 03:57:26 cvsps Exp $
 */

#include "kernel.h"
#include "errno.h"
#include "globals.h"
#include "fs/vfs.h"
#include "fs/file.h"
#include "fs/vnode.h"
#include "fs/vfs_syscall.h"
#include "fs/open.h"
#include "fs/fcntl.h"
#include "fs/lseek.h"
#include "mm/kmalloc.h"
#include "util/string.h"
#include "util/printf.h"
#include "fs/stat.h"
#include "util/debug.h"

/*
 * Syscalls for vfs. Refer to comments or man pages for implementation.
 * Do note that you don't need to set errno, you should just return the
 * negative error code.
 */

/* To read a file:
 *      o fget(fd)
 *      o call its virtual read vn_op
 *      o update f_pos
 *      o fput() it
 *      o return the number of bytes read, or an error
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EBADF
 *        fd is not a valid file descriptor or is not open for reading.
 *      o EISDIR
 *        fd refers to a directory.
 *
 * In all cases, be sure you do not leak file refcounts by returning before
 * you fput() a file that you fget()'ed.
 */
int do_read(int fd, void *buf, size_t nbytes) {
    // Validate the file descriptor range
    if (fd < 0 || fd >= NFILES) {
        dbg(DBG_PRINT, "(GRADING2B)\n");
        return -EBADF; // Bad file descriptor error
    }

    // Acquire file_t structure from the file descriptor
    file_t *file = fget(fd);
    if (!file) {
        dbg(DBG_PRINT, "(GRADING2B)\n");
        return -EBADF; // File not found
    }

    // Check if the file is open for reading
    if (!(file->f_mode & FMODE_READ)) {
        
        fput(file); // Release file reference
        dbg(DBG_PRINT, "(GRADING2B)\n");
        return -EBADF; // Not open for reading
    }

    // Check if the file is a directory
    if (S_ISDIR(file->f_vnode->vn_mode)) {
        
        fput(file); // Release file reference
        dbg(DBG_PRINT, "(GRADING2B)\n");
        return -EISDIR; // Cannot read from a directory
    }

    // Perform the read operation
    dbg(DBG_PRINT, "(GRADING2B)\n");
    int bytesRead = file->f_vnode->vn_ops->read(file->f_vnode, file->f_pos, buf, nbytes);

    // This might be wrong
    if (bytesRead > 0) {
        // Update the file position

        file->f_pos += bytesRead;
        dbg(DBG_PRINT, "(GRADING2B)\n");
    }

    // Release the file reference before returning
    fput(file);

    // Return the number of bytes read or an error code
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return bytesRead;
}

/* Very similar to do_read.  Check f_mode to be sure the file is writable.  If
 * f_mode & FMODE_APPEND, do_lseek() to the end of the file, call the write
 * vn_op, and fput the file.  As always, be mindful of refcount leaks.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EBADF
 *        fd is not a valid file descriptor or is not open for writing.
 */
int do_write(int fd, const void *buf, size_t nbytes) {
    // Check for valid file descriptor
    if (fd < 0 || fd >= NFILES) {
        dbg(DBG_PRINT, "(GRADING2B)\n");
        return -EBADF; // Invalid file descriptor
    }

    // Get the file structure
    file_t *file = fget(fd);  
    if (!file) {
        dbg(DBG_PRINT, "(GRADING2B)\n");
        return -EBADF; // File not found
    }

    // Check if file is a directory or if write operation is not allowed.
    if (S_ISDIR(file->f_vnode->vn_mode) || !(file->f_vnode->vn_ops->write)) {
        fput(file); // Release the file.
        dbg(DBG_PRINT, "(GRADING2B)\n");
        return -EISDIR; // Is a directory error.
    }

    // Check if the file is open for writing
    if (!(file->f_mode & FMODE_WRITE)) {
        fput(file); // Release the file reference
        dbg(DBG_PRINT, "(GRADING2B)\n"); 
        return -EBADF; // Not open for writing
    }

    // Handle append mode.
    off_t pos = file->f_pos;
    if (file->f_mode & FMODE_APPEND) {
        pos = do_lseek(fd, 0, SEEK_END); // Move to the end of the file.
        dbg(DBG_PRINT, "(GRADING2B)\n"); 
    }

    // Perform the write operation.
    int written = file->f_vnode->vn_ops->write(file->f_vnode, pos, buf, nbytes);
    if (written >= 0) {
        file->f_pos = pos + written; // Update the file position.
        dbg(DBG_PRINT, "(GRADING2B)\n"); 
    }
    KASSERT((S_ISCHR(file->f_vnode->vn_mode)) || (S_ISBLK(file->f_vnode->vn_mode)) || ((S_ISREG(file->f_vnode->vn_mode)) && (file->f_pos <= file->f_vnode->vn_len)));
    dbg(DBG_PRINT, "(GRADING2A 3.a)\n");

    fput(file); // Release the file reference.
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return written;
}

/*
 * Zero curproc->p_files[fd], and fput() the file. Return 0 on success
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EBADF
 *        fd isn't a valid open file descriptor.
 */
int do_close(int fd) {
    //NOT_YET_IMPLEMENTED("VFS: do_close");
  if(fd<0||fd>=NFILES||curproc->p_files[fd]==0)// vsftest checks for negative, huge Fd and bad fd, made sure we are not closing a closed file again
  {
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return -EBADF;
  }
  fput(curproc->p_files[fd]);
  curproc->p_files[fd]=NULL;
  dbg(DBG_PRINT, "(GRADING2B)\n"); 
  return 0;
  }

/* To dup a file:
 *      o fget(fd) to up fd's refcount
 *      o get_empty_fd()
 *      o point the new fd to the same file_t* as the given fd
 *      o return the new file descriptor
 *
 * Don't fput() the fd unless something goes wrong.  Since we are creating
 * another reference to the file_t*, we want to up the refcount.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EBADF
 *        fd isn't an open file descriptor.
 *      o EMFILE
 *        The process already has the maximum number of file descriptors open
 *        and tried to open a new one.
 */
int do_dup(int fd) {
    //NOT_YET_IMPLEMENTED("VFS: do_dup");
  if(fd<0||fd>=NFILES)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return -EBADF;
  }
  file_t* pointToFile=fget(fd);
  if(!pointToFile)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return -EBADF;
  }
  int newEmptyFd=get_empty_fd(curproc);
  curproc->p_files[newEmptyFd]=pointToFile;
  dbg(DBG_PRINT, "(GRADING2B)\n"); 
  return newEmptyFd;
}

/* Same as do_dup, but insted of using get_empty_fd() to get the new fd,
 * they give it to us in 'nfd'.  If nfd is in use (and not the same as ofd)
 * do_close() it first.  Then return the new file descriptor.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EBADF
 *        ofd isn't an open file descriptor, or nfd is out of the allowed
 *        range for file descriptors.
 */
int do_dup2(int ofd, int nfd) {
    //NOT_YET_IMPLEMENTED("VFS: do_dup2");
  if(ofd<0||ofd>=NFILES||nfd<0||nfd>NFILES)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return -EBADF;
  }
  file_t* pointToFile=fget(ofd);
  if(!pointToFile)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return -EBADF;
  }
  if(curproc->p_files[nfd]!=0&&nfd!=ofd)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    do_close(nfd);
  }
  if(ofd==nfd)
  {
    fput(pointToFile);
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return nfd;
  }
  curproc->p_files[nfd]=pointToFile;
  dbg(DBG_PRINT, "(GRADING2B)\n"); 
  return nfd;
  }

/*
 * This routine creates a special file of the type specified by 'mode' at
 * the location specified by 'path'. 'mode' should be one of S_IFCHR or
 * S_IFBLK (you might note that mknod(2) normally allows one to create
 * regular files as well-- for simplicity this is not the case in Weenix).
 * 'devid', as you might expect, is the device identifier of the device
 * that the new special file should represent.
 *
 * You might use a combination of dir_namev, lookup, and the fs-specific
 * mknod (that is, the containing directory's 'mknod' vnode operation).
 * Return the result of the fs-specific mknod, or an error.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EINVAL
 *        mode requested creation of something other than a device special
 *        file.
 *      o EEXIST
 *        path already exists.
 *      o ENOENT
 *        A directory component in path does not exist.
 *      o ENOTDIR
 *        A component used as a directory in path is not, in fact, a directory.
 *      o ENAMETOOLONG
 *        A component of path was too long.
 */
int do_mknod(const char *path, int mode, unsigned devid) {
    //NOT_YET_IMPLEMENTED("VFS: do_mknod");
  size_t nameLen=0;
  const char* name=NULL;
  vnode_t *res_vnodeDir=NULL;
  int resultErrorCode=0;
  resultErrorCode=dir_namev(path, &nameLen, &name,NULL,&res_vnodeDir);
  /*
  if(resultErrorCode < 0) {
  	return resultErrorCode;
  }
  */
  KASSERT(NULL != res_vnodeDir->vn_ops->mknod);
  dbg(DBG_PRINT, "(GRADING2A 3.b)\n");
  vnode_t* res_vnodeLookup=NULL;
  resultErrorCode=lookup(res_vnodeDir,name,nameLen,&res_vnodeLookup);
  /*
  if(resultErrorCode!=-ENOENT)
  {
    vput(res_vnodeDir);
    return resultErrorCode;
  }
  */
  resultErrorCode=res_vnodeDir->vn_ops->mknod(res_vnodeDir,name,nameLen,mode,devid);
  vput(res_vnodeDir);
  dbg(DBG_PRINT, "(GRADING2A)\n"); 
  return resultErrorCode;
}

/* Use dir_namev() to find the vnode of the dir we want to make the new
 * directory in.  Then use lookup() to make sure it doesn't already exist.
 * Finally call the dir's mkdir vn_ops. Return what it returns.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EEXIST
 *        path already exists.
 *      o ENOENT
 *        A directory component in path does not exist.
 *      o ENOTDIR
 *        A component used as a directory in path is not, in fact, a directory.
 *      o ENAMETOOLONG
 *        A component of path was too long.
 */
int do_mkdir(const char *path) {
    //Finding the name of the file, the name's length, and the vnode of its directory
	size_t newDirNameLength;
	int result;
	const char *newDirName;
	vnode_t *dirVnode;
	vnode_t *resultVnode;
	result = dir_namev(path, &newDirNameLength, &newDirName, NULL, &dirVnode);
    if(result != 0) {
      dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return result;
    }
  	if(newDirNameLength==0)
  	{
      dbg(DBG_PRINT, "(GRADING2B)\n"); 
    	vput(dirVnode);
    	return 0;
  	}
  	if(dirVnode->vn_ops->mkdir==NULL)
  	{
    	vput(dirVnode);
      dbg(DBG_PRINT, "(GRADING2B)\n"); 
    	return -ENOTDIR;
  	}

  	KASSERT(NULL != dirVnode->vn_ops->mkdir);
  	dbg(DBG_PRINT, "(GRADING2A 3.c)\n");

	//Checking if the directory already exists
	result = lookup(dirVnode, newDirName, newDirNameLength, &resultVnode);
	//if(nameLength > NAME_LEN) {return -ENAMETOOLONG;}
	if (result == -ENOENT) {
		result = dirVnode->vn_ops->mkdir(dirVnode, newDirName,newDirNameLength);
    vput(dirVnode);
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return result;
	}
  vput(dirVnode);
  vput(resultVnode);
  dbg(DBG_PRINT, "(GRADING2B)\n"); 
  return -EEXIST;

	
}

/* Use dir_namev() to find the vnode of the directory containing the dir to be
 * removed. Then call the containing dir's rmdir v_op.  The rmdir v_op will
 * return an error if the dir to be removed does not exist or is not empty, so
 * you don't need to worry about that here. Return the value of the v_op,
 * or an error.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EINVAL
 *        path has "." as its final component.
 *      o ENOTEMPTY
 *        path has ".." as its final component.
 *      o ENOENT
 *        A directory component in path does not exist.
 *      o ENOTDIR
 *        A component used as a directory in path is not, in fact, a directory.
 *      o ENAMETOOLONG
 *        A component of path was too long.
 */
int do_rmdir(const char *path) {
    //Finding the name of the file, the name's length, and the vnode of its directory
	size_t dirNameLength;
	const char *dirName;
	vnode_t *parentDirVnode;
	int result = 0;
	result = dir_namev(path, &dirNameLength, &dirName, NULL, &parentDirVnode);
  if(result!=0)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return result;
  }

	//Checking for error cases.
	//if(nameLength > NAME_LEN) {return -ENAMETOOLONG;}
	//if(result == -ENOENT || result == -ENOTDIR) {return result;}
	const char *lastTwo = &dirName[dirNameLength - 2];
	const char *lastOne = &dirName[dirNameLength - 1];
	//Add Additional Error Checks including .. and .
	if(strcmp(lastOne, ".") == 0){
		if(strcmp(lastTwo, "..") == 0) {
      vput(parentDirVnode);
      dbg(DBG_PRINT, "(GRADING2B)\n"); 
			return -ENOTEMPTY;
		}
    vput(parentDirVnode);
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
		return -EINVAL;
	}



  vnode_t* lookupResVnode;
  result= lookup(parentDirVnode,dirName,dirNameLength,&lookupResVnode);
  if(result==0&&parentDirVnode->vn_ops->rmdir!=NULL)
  {
    	KASSERT(NULL != parentDirVnode->vn_ops->rmdir);
		dbg(DBG_PRINT, "(GRADING2A 3.d)\n");
		dbg(DBG_PRINT, "(GRADING2B)\n");
      	result=parentDirVnode->vn_ops->rmdir(parentDirVnode, dirName, dirNameLength);
      	vput(parentDirVnode);
      	vput(lookupResVnode);
        dbg(DBG_PRINT, "(GRADING2B)\n"); 
      	return result;
  }

	
	//Calling Parent Directory's rmdir v_op
  vput(parentDirVnode);
  dbg(DBG_PRINT, "(GRADING2B)\n"); 
	return result;
}

/*
 * Similar to do_rmdir, but for files.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EPERM
 *        path refers to a directory.
 *      o ENOENT
 *        Any component in path does not exist, including the element at the
 *        very end.
 *      o ENOTDIR
 *        A component used as a directory in path is not, in fact, a directory.
 *      o ENAMETOOLONG
 *        A component of path was too long.
 */
int do_unlink(const char *path) {
    //NOT_YET_IMPLEMENTED("VFS: do_unlink");Work in progress
  size_t nameLen=0;
  const char* name=NULL;
  vnode_t *res_vnode=NULL;
  int resultErrorCode=0;
  resultErrorCode=dir_namev(path, &nameLen, &name,NULL,&res_vnode);
  if(resultErrorCode<0)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n"); 
    return resultErrorCode;
  }

  vnode_t *res_vnodeLookup=NULL;
  resultErrorCode=lookup(res_vnode,name,nameLen,&res_vnodeLookup);
  if(resultErrorCode<0)
  {
    vput(res_vnode);
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return resultErrorCode;
  }
  if(S_ISDIR(res_vnodeLookup->vn_mode))
  {
    vput(res_vnodeLookup);
    vput(res_vnode);
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return -EPERM;
  }
  int unlinkRetVal=0;
  KASSERT(NULL != res_vnode->vn_ops->unlink);
  dbg(DBG_PRINT, "(GRADING2A 3.e)\n");
  dbg(DBG_PRINT, "(GRADING2B)\n");
  unlinkRetVal=res_vnode->vn_ops->unlink(res_vnode,name,nameLen);
  vput(res_vnodeLookup);
  vput(res_vnode);
  dbg(DBG_PRINT, "(GRADING2B)\n");
  return unlinkRetVal;
}

/* To link:
 *      o open_namev(from)
 *      o dir_namev(to)
 *      o call the destination dir's (to) link vn_ops.
 *      o return the result of link, or an error
 *
 * Remember to vput the vnodes returned from open_namev and dir_namev.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EEXIST
 *        to already exists.
 *      o ENOENT
 *        A directory component in from or to does not exist.
 *      o ENOTDIR
 *        A component used as a directory in from or to is not, in fact, a
 *        directory.
 *      o ENAMETOOLONG
 *        A component of from or to was too long.
 *      o EPERM
 *        from is a directory.
 */
int do_link(const char *from, const char *to) {
    //NOT_YET_IMPLEMENTED("VFS: do_link"); 
  vnode_t* res_vnodeOpen=NULL;
  int openRetVal=0;
  openRetVal= open_namev(from,0,&res_vnodeOpen,NULL);
  if(openRetVal<0)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return openRetVal;
  }

  if(S_ISDIR(res_vnodeOpen->vn_mode)) {
    vput(res_vnodeOpen);
    return -EPERM;
  }

  vnode_t* res_vnodeDir=NULL;
  size_t nameLen=0;
  const char* name=NULL;
  int dirRetVal=0;
  int lookupRetVal=0;
  dirRetVal=dir_namev(to,&nameLen,&name,NULL,&res_vnodeDir);
  //lookupRetVal=dir_namev(to,&nameLen,&name,NULL,&res_vnodeDir);// delete in kernel 3
  
    if(dirRetVal<0)
  {
    vput(res_vnodeOpen);
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return dirRetVal;
  }
  
  vnode_t* resvnodeLookup=NULL;
  lookupRetVal=lookup(res_vnodeDir,name,nameLen,&resvnodeLookup);
  

  if(lookupRetVal == 0) {
    vput(res_vnodeOpen);
    vput(res_vnodeDir);
    vput(resvnodeLookup);
    return -EEXIST;
  }
  else if(lookupRetVal!= -ENOENT)
  {
    vput(res_vnodeOpen);
    vput(res_vnodeDir);
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return lookupRetVal;
  }

  
  int linkRetVal=0;
  linkRetVal=res_vnodeDir->vn_ops->link(res_vnodeOpen,res_vnodeDir,name,nameLen);
  vput(res_vnodeOpen);
  vput(res_vnodeDir);
  //vput(resvnodeLookup);
  dbg(DBG_PRINT, "(GRADING2B)\n");

    //vput(res_vnodeDir);
    //dbg(DBG_PRINT, "(GRADING2B)\n");

  return linkRetVal;
  
}



/*      o link newname to oldname
 *      o unlink oldname
 *      o return the value of unlink, or an error
 *
 * Note that this does not provide the same behavior as the
 * Linux system call (if unlink fails then two links to the
 * file could exist).
 */
int do_rename(const char *oldname, const char *newname) {
	  //link newname to oldname
	  int result=do_link(oldname, newname);
   dbg(DBG_PRINT, "(GRADING2B...do rename test)\n");
   return result;

   /*

    if(result<0)
    {
      dbg(DBG_PRINT, "(GRADING2B...do rename test1)\n");
      return result;
    }
	  //unlink oldname
	  //return the value of unlink, or an error
	  //int result = 0;
    //if base is cwd, then the path should be oldname?
	  
    result = do_unlink(oldname);
    dbg(DBG_PRINT, "(GRADING2B..do_rename test2)\n");
    return result;
    */
}

/* Make the named directory the current process's cwd (current working
 * directory).  Don't forget to down the refcount to the old cwd (vput()) and
 * up the refcount to the new cwd (open_namev() or vget()). Return 0 on
 * success.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o ENOENT
 *        path does not exist.
 *      o ENAMETOOLONG
 *        A component of path was too long.
 *      o ENOTDIR
 *        A component of path is not a directory.
 */
int do_chdir(const char *path) {
    //if (strlen(path) > MAXPATHLEN){return ENAMETOOLONG;}
	  vnode_t *old_cwd = curproc->p_cwd;
	  //size_t *namelen;
	  //char *name;
	  vnode_t *res_vnode;
    int result = 0;
    result=open_namev(path,0,&res_vnode,NULL);
	  //up the refcount to the new cwd inside dir_namev()
    if (result != 0)
      {
        dbg(DBG_PRINT, "(GRADING2B)\n");
        return -ENOENT;
      }
    if (!S_ISDIR(res_vnode->vn_mode)){
      vput(res_vnode);
      dbg(DBG_PRINT, "(GRADING2B)\n");
      return -ENOTDIR;}
    //Make the named directory the current process's cwd
	  curproc->p_cwd = res_vnode;
	  //down the refcount to the old cwd
	  vput(old_cwd);
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return 0;//success
}

/* Call the readdir vn_op on the given fd, filling in the given dirent_t*.
 * If the readdir vn_op is successful, it will return a positive value which
 * is the number of bytes copied to the dirent_t.  You need to increment the
 * file_t's f_pos by this amount.  As always, be aware of refcounts, check
 * the return value of the fget and the virtual function, and be sure the
 * virtual function exists (is not null) before calling it.
 *
 * Return either 0 or sizeof(dirent_t), or -errno.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EBADF
 *        Invalid file descriptor fd.
 *      o ENOTDIR
 *        File descriptor does not refer to a directory.
 */
int do_getdent(int fd, struct dirent *dirp) {
    //Call the readdir vn_op on the given fd
  if(fd<0||fd>=NFILES)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return -EBADF;
  }
    int result = 0;
    file_t *dir = fget(fd); 
    //error check: Invalid file descriptor fd
    if (!dir) {
      dbg(DBG_PRINT, "(GRADING2B)\n");
      return -EBADF; //Invalid file descriptor
    }
    //filling in the given dirent_t*
    vnode_t *dirVnode = dir->f_vnode;
    off_t dirOffset = dir->f_pos;
    //error check: File descriptor does not refer to a directory
    if (!S_ISDIR(dirVnode->vn_mode)){
      fput(dir);
      dbg(DBG_PRINT, "(GRADING2B)\n");
      return -ENOTDIR;}
    //s5fs_readdir(vnode_t *vnode, off_t offset, struct dirent *d)
    result = dirVnode->vn_ops->readdir(dirVnode, dirOffset, dirp);
    if (result <= 0){//return a positive value
        //readdir failed
        fput(dir);
        dbg(DBG_PRINT, "(GRADING2B)\n");
        return 0;
    }
    //increment the * file_t's f_pos by this return value of readdir
    dir->f_pos+= result;
    fput(dir);
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return sizeof(*dirp);

    //NOT_YET_IMPLEMENTED("VFS: do_getdent");
    //return -1;
}

/*
 * Modify f_pos according to offset and whence.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o EBADF
 *        fd is not an open file descriptor.
 *      o EINVAL
 *        whence is not one of SEEK_SET, SEEK_CUR, SEEK_END; or the resulting
 *        file offset would be negative.
 */
int do_lseek(int fd, int offset, int whence) {
    //access fd's loc
  if(fd<0||fd>=NFILES)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return -EBADF;
  }
  file_t *file = fget(fd);
  if(!file)
  {
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return -EBADF;
  }  
  //check error EINVAL
  if (whence != SEEK_SET && whence !=SEEK_CUR && whence != SEEK_END){
    fput(file);
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return -EINVAL;}
  if(whence==SEEK_SET)
  {
    if(offset<0)
    {
      fput(file);
      dbg(DBG_PRINT, "(GRADING2B)\n");
      return -EINVAL;
    }
    file->f_pos=offset;
  }
  else if(whence==SEEK_CUR)
  {
    if(file->f_pos+offset<0)
    {
      fput(file);
      dbg(DBG_PRINT, "(GRADING2B)\n");
      return -EINVAL;
    }
    file->f_pos+=offset;
  }
  else if(whence==SEEK_END)
  {
    if(file->f_vnode->vn_len+offset<0)
    {
      fput(file);
      dbg(DBG_PRINT, "(GRADING2B)\n");
      return -EINVAL;
    }
    file->f_pos=file->f_vnode->vn_len+offset;
  }
  int reVal=file->f_pos;
  fput(file);
  dbg(DBG_PRINT, "(GRADING2B)\n");
  return reVal;//return new offset???
}

/*
 * Find the vnode associated with the path, and call the stat() vnode operation.
 *
 * Error cases you must handle for this function at the VFS level:
 *      o ENOENT
 *        A component of path does not exist.
 *      o ENOTDIR
 *        A component of the path prefix of path is not a directory.
 *      o ENAMETOOLONG
 *        A component of path was too long.
 *      o EINVAL
 *        path is an empty string.
 */
int do_stat(const char *path, struct stat *buf) {
    if (strcmp(path, "") == 0) {
      dbg(DBG_PRINT, "(GRADING2B)\n");
      return -EINVAL;
    }
    //if (strlen(path) > MAXPATHLEN){return -ENAMETOOLONG;}
	  size_t *namelen = NULL;
	  const char *name;
	  vnode_t *res_vnode;
    int result = 0;
    result=open_namev(path,0,&res_vnode,NULL);
    if(result<0)
    {
      dbg(DBG_PRINT, "(GRADING2B)\n");
      return result;
    }
    KASSERT(NULL != res_vnode->vn_ops->stat);
    dbg(DBG_PRINT, "(GRADING2A 3.f)\n");
    dbg(DBG_PRINT, "(GRADING2B)\n");

    result = res_vnode->vn_ops->stat(res_vnode, buf);
    vput(res_vnode);
    dbg(DBG_PRINT, "(GRADING2B)\n");
    return result;//not sure the return value
}

#ifdef __MOUNTING__
/*
 * Implementing this function is not required and strongly discouraged unless
 * you are absolutely sure your Weenix is perfect.
 *
 * This is the syscall entry point into vfs for mounting. You will need to
 * create the fs_t struct and populate its fs_dev and fs_type fields before
 * calling vfs's mountfunc(). mountfunc() will use the fields you populated
 * in order to determine which underlying filesystem's mount function should
 * be run, then it will finish setting up the fs_t struct. At this point you
 * have a fully functioning file system, however it is not mounted on the
 * virtual file system, you will need to call vfs_mount to do this.
 *
 * There are lots of things which can go wrong here. Make sure you have good
 * error handling. Remember the fs_dev and fs_type buffers have limited size
 * so you should not write arbitrary length strings to them.
 */
int do_mount(const char *source, const char *target, const char *type) {
    NOT_YET_IMPLEMENTED("MOUNTING: do_mount");
    return -EINVAL;
}

/*
 * Implementing this function is not required and strongly discouraged unless
 * you are absolutley sure your Weenix is perfect.
 *
 * This function delegates all of the real work to vfs_umount. You should not
 * worry about freeing the fs_t struct here, that is done in vfs_umount. All
 * this function does is figure out which file system to pass to vfs_umount and
 * do good error checking.
 */
int do_umount(const char *target) {
    NOT_YET_IMPLEMENTED("MOUNTING: do_umount");
    return -EINVAL;
}
#endif