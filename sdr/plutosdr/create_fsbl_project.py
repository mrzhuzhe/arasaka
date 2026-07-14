"""
hsi open_hw_design build/system_top.xsa
set cpu_name [lindex [hsi get_cells -filter {IP_TYPE==PROCESSOR}] 0]

setws ./build/sdk
app create -name fsbl -hw build/system_top.xsa -proc $cpu_name -os standalone -lang C -template {Zynq FSBL}
app config -name fsbl -set build-config release
app build -name fsbl

"""

import vitis
import hsi
import os

def get_metadata(**kwargs):
    xsa = ""
    open_xsa = 0
    ret_metadata = {'arch' : '', 'target_proc' : ''}
    for key, value in kwargs.items():
        if key == "xsa":
            xsa = value
        if key == "open_xsa":
            open_xsa = 1
    
    if open_xsa == 1:
        if xsa != "":
            print("Info: Using XSA file: " + xsa + " to extract HW metadata using HSI Python API")
            HwDesign = hsi.HwManager.open_hw_design(xsa)
            ret_metadata['arch'] = HwDesign.FAMILY
            for proc in HwDesign.get_cells(hierarchical='true',filter='IP_TYPE==PROCESSOR'):
                if proc.IP_NAME == "psu_cortexa53" or proc.IP_NAME == "psv_cortexa72" or proc.IP_NAME == "ps7_cortexa9":
                    ret_metadata['target_proc'] = proc.IP_NAME+"_0"
                    #notice there are two cpu
            HwDesign.close()
        else:
            print("Error: No XSA passed. HW metadata will not be extracted.")
    else:
        print("Info: no need to open XSA")
    
    return ret_metadata

client = vitis.create_client()
xsa = os.path.join(os.getcwd(), "./build/system_top.xsa")
workspace = os.path.join(os.getcwd(), "./build/sdk")
client.set_workspace(workspace)

metadata = get_metadata(xsa=xsa, open_xsa="1")
arch = metadata['arch']
target_proc = metadata['target_proc']
print("Info: Detected arch: " + arch)
print("Info: Using target processor: " + target_proc)

platform = client.create_platform_component(name = "fsbl",
    hw_design = xsa,os = "standalone",compiler = "gcc",
    cpu = target_proc, template = "zynq_fsbl")

#Debug start 
#list all domains (there will just be one here). Users can use print(domains) to see the attributes
domains = platform.list_domains()
platform_domain_name = domains[0]['domain_name']
print("Info: platform created a domain called " + platform_domain_name)

#get domain object. I used the format to pass a variable inside quoatation
domain_object = platform.get_domain(name = "{}".format(platform_domain_name))

# users can view the os settings of the domain_object. same can be used for get_libs and get_drivers()
os_object = domain_object.get_os()
print("OS for " + platform_domain_name + " is " + os_object['os'])

#This will list all the os parameters for the OS. Users can see this in the bsp.yaml which replaces the mss file. 
#For ease of use, Users should look at the bsp.yaml to get the valid values.
#os_params = domain_object.list_params("os", "{}".format(os_object['os']))

#For example, I can read the standalone_stdin param
standalone_stdin = domain_object.get_config(option = 'os', param = 'standalone_stdin')
print("Info: standalone_stdin for " + platform_domain_name + " is " + standalone_stdin['value'])
#domain_object.set_config(option = 'os', param = 'standalone_stdin', value = 'true') 

# Get compiler flags
proc_compiler_flags = domain_object.get_config(option = 'proc', param = 'proc_compiler_flags')
print("Current proc_compiler_flags: " + proc_compiler_flags['value'])

proc_extra_compiler_flags = domain_object.get_config(option = 'proc', param = 'proc_extra_compiler_flags')
print("Current proc_extra_compiler_flags: " + proc_compiler_flags['value'])
#Debug end

# app config -name fsbl -set build-config release 
platform = client.get_component(name="fsbl")
status = platform.build()
