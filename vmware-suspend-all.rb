#!/usr/bin/ruby

# VMRUN='/usr/bin/vmrun'
# VMRUN="/Applications/VMware Fusion.app/Contents/Library/vmrun"
VMRUN="/Applications/VMware Fusion.app/Contents/Library/vmrun" 

vms = []
open("|'#{VMRUN}' list") do |p| vms = p.readlines.map {|l| l.chomp } end
vms.shift

print "Currently running VMs:\n"
vms.each do |vmxfile|
	print " #{vmxfile}\n"
end
print "\n"

vms.each do |vmxfile|
  print " suspending #{vmxfile} ...\n"
  system("'#{VMRUN}' suspend \"#{vmxfile}\"")
end

