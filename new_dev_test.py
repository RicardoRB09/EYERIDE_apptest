#FMS: https://fms-master.eyerideonline.com/GPS
#FMS API: https://fms-master.eyerideonline.com/swagger/ui/index

import requests, json

class FMS_API:
  def __init__(self, fms_username, fms_password, company_id, client_id):

    self.username = fms_username
    self.password = fms_password
    self.companyID = company_id
    self.client_id = client_id
    self.host = 'https://fms-master.eyerideonline.com/api'
    self.access_token = ''
    if self.access_token == '':
      self.access_token = self.retrieve_token()
      print(self.access_token)


  def retrieve_token(self):
    '''
    Retrieves Bearer Token to be used as authentication by API.
    The Bearer Token must be in the Headers of the API Call.
    See here for more information: 
    https://swagger.io/docs/specification/authentication/bearer-authentication/
    '''
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json',
    }

    data = f"client_id={self.client_id}&username={self.username}&password={self.password}&grant_type=password"

    response = requests.post('https://fms-master.eyerideonline.com/oauth/token', headers=headers, data=data)
    print(response, response.reason, response.status_code)
    r = json.loads(response.text)
    return r['access_token']


  def api_call(self, url):
    '''
    Makes an API call using the Bearer Token and returns the response in JSON Format
    '''
    if self.access_token == '':
      self.access_token = self.retrieve_token()
    headers = {'Authorization': f"Bearer {self.access_token}"}
    response = requests.get(f'{self.host + url}', headers=headers)
    print(response.reason, response.status_code)
    response = json.loads(response.text)
    return response

  def user_profile(self):
    '''
    Returns information about the user's profile.
    '''
    response = fms_api.api_call(f'/user/profile')
    return response

if __name__ == '__main__':
  my_fms_username = 'newdevtesthaven'
  my_fms_password = 'Em@pwc!eN10'
  my_company_id = '23'
  my_client_id = "0ce74b30-9941-42fb-805c-770cdd7870bb"

  fms_api = FMS_API(my_fms_username,my_fms_password, my_company_id, my_client_id)

  response = fms_api.user_profile()

  #Write the response to a file
  data = json.dumps(response,  indent=4, sort_keys=True)
  with open('user_profile.json', 'w') as f:
      f.write(data)