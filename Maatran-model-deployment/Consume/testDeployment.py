#The following pyhton files details an example scenario for consuming the endpoint previously deployed using the deploy-script.
#Use this for testing/debugging purposes

import urllib.request
import json
import os
import ssl

def allowSelfSignedHttps(allowed):
    # bypass the server certificate verification on client side
    if allowed and not os.environ.get('PYTHONHTTPSVERIFY', '') and getattr(ssl, '_create_unverified_context', None):
        ssl._create_default_https_context = ssl._create_unverified_context

#allowSelfSignedHttps(True) # this line is needed if you use self-signed certificate in your scoring service.

# Request data goes here
# The example below assumes JSON formatting which may be updated
# depending on the format your endpoint expects.
# More information can be found here:
# https://docs.microsoft.com/azure/machine-learning/how-to-deploy-advanced-entry-script
# data = {tuple([-0.80724718, -1.26112705, -0.82575085,  0.69078914,  1.70343448, -0.53208757])}

body = str.encode('''{
    "data":[-0.80724718, -1.26112705, -0.82575085,  0.69078914,  1.70343448, -0.53208757]
}''')

#The scoring url for the REST API. This needs to be updated after every new deployment
url = 'https://endpoint-02070203078896.centralindia.inference.ml.azure.com/score'
# Replace this with the primary/secondary key or AMLToken for the endpoint. This needs to be updated after every new deployment
api_key = '6cv5YqZLY99gTecPUS8irTHv0Wn4CYSC'
if not api_key:
    raise Exception("A key should be provided to invoke the endpoint")

# The azureml-model-deployment header will force the request to go to a specific deployment.
# Remove this header to have the request observe the endpoint traffic rules
headers = {'Content-Type':'application/json', 'Authorization':('Bearer '+ api_key), 'azureml-model-deployment': 'blue' }

req = urllib.request.Request(url, body, headers)

try:
    response = urllib.request.urlopen(req)

    result = response.read()
    print(result)
except urllib.error.HTTPError as error:
    print("The request failed with status code: " + str(error.code))

    # Print the headers - they include the requert ID and the timestamp, which are useful for debugging the failure
    print(error.info())
    print(error.read().decode("utf8", 'ignore'))
