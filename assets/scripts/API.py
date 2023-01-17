# A file for handling parameters and passing information between the scripts and the GUI
# It also is responsible for calling scripts accordingly and recieving and handling parameters
# This package has potential for direct communication w/ dart: https://pub.dev/packages/starflut/example
import os

directory = "assets/scripts"
filenames = {"MIOP":"MIOP.py", "TC":"TC.py", "RC":"RC.py", "FC":"FC.py"}

# A static class for executing scripts with specified parameters and settings
class DWTP:
    def MIOP(params): 
        # Run the MIOP python script
        # with the following possible parameters:
        ## threads: the number of gamepad threads
        ## players: 
        ## 
        ## 
        ## 
        ## 
        ## 
        ## 
        ## 
        # MIOP.main(params[''], params[''])
        raise NotImplementedError
    
    def TC(params): 
        # Run the TC python script
        # with the _ parameters
        # TC.main()
        raise NotImplementedError
        
    def RC(params):
        # Run the RC python script
        # with the _ parameters
        # RC.main()
        raise NotImplementedError
        
    def FC(params):
        # Run the FC python script
        # with the _ parameters
        # FC.main()
        raise NotImplementedError

def APIException():
    # A function for exception handling if invalid parameters are passed to the API
    raise ValueError("Invalid parameters")