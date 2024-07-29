.PHONY: all clean all_kernel all_user clean_kernel clean_user nyi
BACKUP_FNAME = kernel-backup-`date +%d%b%Y-%H%M%S`.tar.gz
BACKUP_DIR = $(HOME)/Shared-ubuntu

all: all_kernel all_user

all_kernel:
	@ cd kernel && $(MAKE) all

all_user:
	@ cd user && $(MAKE) all

clean: clean_kernel clean_user

clean_kernel:
	@ cd kernel && $(MAKE) clean

clean_user:
	@ cd user && $(MAKE) clean

nyi:
	@ cd kernel && $(MAKE) nyi

procs-submit:
	tar cvzf procs-submit.tar.gz \
		Config.mk \
		procs-README.txt \
		kernel/main/kmain.c \
		kernel/proc/kmutex.c \
		kernel/proc/kthread.c \
		kernel/proc/proc.c \
		kernel/proc/sched.c \
		kernel/proc/sched_helper.c

vfs-submit:
	tar cvzf vfs-submit.tar.gz \
		Config.mk \
		vfs-README.txt \
		kernel/main/kmain.c \
		kernel/proc/kmutex.c \
		kernel/proc/kthread.c \
		kernel/proc/proc.c \
		kernel/proc/sched.c \
		kernel/proc/sched_helper.c \
		kernel/fs/namev.c \
		kernel/fs/open.c \
		kernel/fs/vfs_syscall.c \
		kernel/fs/vn_special.c

vm-submit:
	tar cvzf vm-submit.tar.gz \
		Config.mk \
		vm-README.txt \
		kernel/main/kmain.c \
		kernel/proc/kmutex.c \
		kernel/proc/kthread.c \
		kernel/proc/proc.c \
		kernel/proc/sched.c \
		kernel/proc/sched_helper.c \
		kernel/fs/namev.c \
		kernel/fs/open.c \
		kernel/fs/vfs_syscall.c \
		kernel/fs/vn_special.c \
		kernel/mm/pframe.c \
		kernel/api/access.c \
		kernel/api/syscall.c \
		kernel/proc/fork.c \
		kernel/vm/anon.c \
		kernel/vm/brk.c \
		kernel/vm/mmap.c \
		kernel/vm/pagefault.c \
		kernel/vm/shadow.c \
		kernel/vm/vmmap.c

backup: vm-submit
	mv vm-submit.tar.gz $(BACKUP_FNAME)
	@if [ -d $(BACKUP_DIR)/ ]; then \
		mv $(BACKUP_FNAME) $(BACKUP_DIR)/$(BACKUP_FNAME); \
		echo ; \
		echo "Backup file created: $(BACKUP_DIR)/$(BACKUP_FNAME)"; \
		/bin/ls -l $(BACKUP_DIR)/$(BACKUP_FNAME); \
	else \
		echo ; \
		echo "Backup file created: $(BACKUP_FNAME)"; \
		/bin/ls -l $(BACKUP_FNAME); \
	fi
