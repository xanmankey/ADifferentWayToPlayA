# A file for handling parameters and passing information between the scripts and the GUI
# It also is responsible for calling scripts accordingly and recieving and handling parameters
# It also calls any necessary utility functions, as the entry point to the program
import os
import sys
import json
from multiprocessing import Process, Event
from dotenv import load_dotenv


directory = "assets/scripts"
filenames = {"MIOP":"MIOP.py", "TC":"TC.py", "RC":"RC.py", "FC":"FC.py", "DC": "DC.py", "utils":"utils.py"}

# A static class for executing scripts with specified parameters and settings
# as well as for handling process communication
class DWTP:
    def __init__(self):
        self.stopEvent = Event()

    def run(self):
        params = DWTP.getParams()
        for param in params:
            match (param['program']):
                case "MIOP":
                    self.MIOP(params=param)
                case "TC":
                    self.TC(params=param)
                case "RC":
                    self.RC(params=param)
                case "FC":
                    self.FC(params=param)
                case "DC":
                    self.DC(params=param)
                case "utils":
                    self.Utils(params=param)
    
    @staticmethod
    def getParams():
        args = sys.argv
        params = []
        for arg in args[1:len(args) - 1]:
            params.append(json.load(arg))
        return params

    def stopPrograms(self):
        # Force all other programs to exit
        # Note that this requires while not stopEvent.is_set() to be checked in each process event loop
        self.stopEvent.set()

    def MIOP(self, params): 
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
        miop = Process(target="MIOP.main", kwargs=(),)
        miop.start()
        miop.join()
        self.stopPrograms()
    
    def TC(self, params): 
        # Run the TC python script
        # with the _ parameters
        # TC.main()
        tc = Process(target="TC.main", kwargs=())
        tc.start()
        tc.join()
        self.stopPrograms()
        
    def RC(self, params):
        # Run the RC python script
        # with the _ parameters
        # RC.main()
        rc = Process(target="RC.main", kwargs=())
        rc.start()
        rc.join()
        self.stopPrograms()
        
    def FC(self, params):
        # Run the FC python script
        # with the _ parameters
        # FC.main()
        fc = Process(target="FC.main", kwargs=())
        fc.start()
        fc.join()
        self.stopPrograms()

    def DC(self, params):
        # Run the DC python script
        # with the _ parameters
        # DC.main()
        dc = Process(target="DC.main", kwargs=())
        dc.start()
        dc.join()
        self.stopPrograms()

    def Utils(self, params):
        # Run one of a few utility functions
        match (params['function']):
            case 'checkToken':


    @staticmethod
    def APIException():
        # A function for exception handling if invalid parameters are passed to the API
        raise ValueError("Invalid parameters")

if __name__ == "__main__":
    dwtp = DWTP()
    dwtp.run()