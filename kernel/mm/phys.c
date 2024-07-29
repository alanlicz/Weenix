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

#include "types.h"
#include "kernel.h"

#include "mm/phys.h"

#include "boot/config.h"

#include "util/debug.h"

#include "multiboot.h"

static char *type_strings[] = {
        "ERROR: type = 0",
        "Usable",
        "Reserved",
        "ACPI Reclaimable",
        "ACPI NVS",
        "GRUB bad ram"
};

static size_t type_count = sizeof(type_strings) / sizeof(char *);

#define NEXT_MMAP(m) ((multiboot_memory_map_t*)(((uintptr_t)(m)) + (m)->size + sizeof((m)->size)))
uintptr_t
phys_detect_highmem(void)
{
    KASSERT(boot_info->flags & MULTIBOOT_INFO_MEM_MAP && "No Memory mapping information provided");
    void* last_mmap = (void*)((uintptr_t)boot_info->mmap_addr + boot_info->mmap_length);
    dbgq(DBG_MM, "Physical Memory Info: KERNEL_PHYS_BASE: 0x%.8x, %d bytes of info\n", KERNEL_PHYS_BASE, boot_info->mmap_length);
    dbgq(DBG_MM, "Physical Memory Map:\n");
    uintptr_t ret = 0;
    for (multiboot_memory_map_t* mmap = (multiboot_memory_map_t*)boot_info->mmap_addr;
            ((uintptr_t)mmap) < boot_info->mmap_addr + boot_info->mmap_length;
            mmap = NEXT_MMAP(mmap)) {
        uint32_t base = (uint32_t)mmap->addr;
        uint32_t len = mmap->len;
        uint32_t type = mmap->type;
        dbgq(DBG_MM, "    0x%.8x-0x%.8x: %s\n", base, base + len,
                     (type < type_count) ? type_strings[type] : "UNDEF");
        if (1 /* Usable */ == type && KERNEL_PHYS_BASE >= base && KERNEL_PHYS_BASE < base + len) {
            if (ret == 0) {
                ret = (uintptr_t)(base + len);
            } else {
                dbgq(DBG_MM, "        Multiple high-mems detected. Ignoring second.\n");
            }
        }
    }
    KASSERT(ret != 0 && "Failed to detect correct physical addresses.");
    return ret;
}

