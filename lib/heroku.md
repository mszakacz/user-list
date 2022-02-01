// https://assessments-users-backend.herokuapp.com/


# list of all users
https://assessment-users-backend.herokuapp.com/users.:131

# list of all users (json)
https://assessment-users-backend.herokuapp.com/users.json

# specific user (from id)
https://assessment-users-backend.herokuapp.com/users/45.:

id = 45

returns:
{   
    "id":44,
    "last_name":"Swift",
    "first_name":"Jasen",
    "status":"active",
    "created_at":"2022-01-04T16:00:48.304Z","updated_at":"2022-01-05T14:26:10.961Z"
}

# specific user (json)
https://assessment-users-backend.herokuapp.com/users/56.json



https://assessment-users-backend.herokuapp.com/users/new.:%22last_name%22:%22$%7Maciej%7%22,%22first_name%22:%22Maciej%22,%22status%22:%22active%22.:

Bad request 