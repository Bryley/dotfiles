
import random
from uuid import getnode as get_mac
from urllib import request

WALLPAPERS = [
    'https://unsplash.com/photos/UWQP3mh5YJI/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Nnx8d2FsbHBhcGVyJTIwZGVza3RvcHxlbnwwfHx8fDE2NjYyMjU0NDk&force=true', # Lagoon
    'https://unsplash.com/photos/zAjdgNXsMeg/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8OHx8d2FsbHBhcGVyJTIwZGVza3RvcHxlbnwwfHx8fDE2NjYyMjU0NDk&force=true', # Hut on water
    'https://unsplash.com/photos/ZqLeQDjY6fY/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTR8fGRlc2t0b3AlMjBiYWNrZ3JvdW5kJTIwdWx0cmF3aWRlfGVufDB8fHx8MTY2NjI0NzgzNg&force=true', # Purple lagoon
    'https://unsplash.com/photos/v7daTKlZzaw/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjY2MjQ3Njg0&force=true', # Night mountains
    'https://unsplash.com/photos/u_-Yd8IFcpE/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTh8fHdhbGxwYXBlciUyMGRlc2t0b3B8ZW58MHx8fHwxNjY2MjI1NDQ5&force=true', # Mountains and clouds
]
WALLPAPERS = [
    # 'https://unsplash.com/photos/jKGFqL3llv0/download?ixid=MnwxMjA3fDB8MXxjb2xsZWN0aW9ufDE5fDEwMzEwNjB8fHx8fDJ8fDE2NjYyNDkyNTc&force=true',
    # 'https://unsplash.com/photos/tmbu4-FW2ik/download?ixid=MnwxMjA3fDB8MXxjb2xsZWN0aW9ufDM0fDEwMzEwNjB8fHx8fDJ8fDE2NjYyNDk0MjI&force=true',
    # 'https://unsplash.com/photos/XZHK8gR1xh4/download?ixid=MnwxMjA3fDB8MXxjb2xsZWN0aW9ufDc3fDEwMzEwNjB8fHx8fDJ8fDE2NjYyNDk2Nzc&force=true', # City
    # 'https://unsplash.com/photos/6oUsyeYXgTg/download?ixid=MnwxMjA3fDB8MXxjb2xsZWN0aW9ufDE0MXwxMDMxMDYwfHx8fHwyfHwxNjY2MjQ5NzU0&force=true', # City 2
    'https://unsplash.com/photos/BNHcxk1CDdw/download?force=true', #Above the clouds
]

random.seed(get_mac())
URL = random.choice(WALLPAPERS)

print(WALLPAPERS.index(URL))

request.urlretrieve(URL, "./test.jpg")
