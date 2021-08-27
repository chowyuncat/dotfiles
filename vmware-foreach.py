#!/usr/bin/env python3
from __future__ import print_function
from os import path
from subprocess import check_output
import sys

# VMRUN='/usr/bin/vmrun'
VMRUN="/Applications/VMware Fusion.app/Contents/Library/vmrun" 


def pretty(vmpath):
    # return ''.join(path.basename(vmpath).split('.', 1)[:-1])
    return path.basename(vmpath)


def vmrun(args):
        assert not isinstance(args, str)
        cmd_list = [VMRUN]
        cmd_list.extend(args)
        r = check_output(cmd_list)
        # print(rne)
        return r.decode('utf-8').split('\n')[:-1]

def main():
    if len(sys.argv) > 1:
        cmd = sys.argv[1]
    else:
        cmd = None
    valid_commands = (
        'pause', 'unpause',
        'suspend', 'resume',
    )
    # if cmd not in valid_commands:
    #   raise Exception('invalid command \'{}\''.format(cmd))

    vms = [
        line.strip() for line in vmrun(['list'])[1:]
    ]

    print('Currently running VMs:')
    if cmd is None:
        for vm in vms:
            print(' {}'.format((vm)))
            return 0
    else:
        for vm in vms:
            print(' {}'.format(pretty(vm)))

    for vm in vms:
        print('{} {}...'.format(cmd, pretty(vm)), end='', flush=True)
        print(vmrun([cmd, vm]))
        print('done')


if __name__ == '__main__':
    sys.exit(main())