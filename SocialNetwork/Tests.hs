module Tests where
import Solution
import Test.HUnit

main = runTestTT allMyTests
allMyTests = test [testssuites1,testssuites2,testssuites3,testssuites4,testssuites5, testssuites6, testssuites7, testssuites8, testssuites9, testssuites10]

-- Information for my tests

-- Users
user1 = (1,"Juan")
user2 = (3,"Lucas")
user3 = (6,"Natalia")
user4 = (7, ".")
user5 = (10,"Juan")
user6 = (100,"!")
user7 = (15,"Mateo")
user8 = (23, "Nicolas")
user9 = (34,"Ludmila")
user10 = (10001,"[]")
user11 = (38, "Pablo")
user12 = (94, "Lucas")
user13 = (84, "David")

-- Lists of users
usersList0 = [user1]
usersList1 = [user1,user2,user3,user4,user5,user6,user7,user8,user9,user10]
usersList2 = [user4,user5,user10]
usersList3 = [user1,user2,user3,user4,user5,user9,user10]
usersList4 = [user1, user5]
usersList5 = [user9]
usersList6 = [user1,user2,user3,user4,user5,user6,user7,user8,user9,user10, user11, user12, user13]

-- Friendships
friendships1 = [(user1,user2),(user2,user3),(user1,user4),(user6,user10),(user2,user9)]
friendships2 = [(user4, user5),(user4,user10),(user5,user10)]
friendships3 = [(user2,user1)]
friendships4 = [(user7,user1),(user7,user9),(user7,user10),(user3,user7),(user7,user5),(user4,user7)]
friendships5 = [(user3,user4),(user3,user5),(user3,user7),(user3,user1),(user3,user10),(user9,user3),(user9,user1),(user9,user2),(user5,user9)]
friendships6 = [(user3,user4),(user3,user5),(user3,user7),(user3,user1),(user3,user10), (user2,user3),(user6,user3),(user8,user3),(user9,user3),(user10,user3),(user11,user3)]
friendships7 = [(user1, user2),(user2,user3),(user4,user5),(user2, user5)]
friendships8 = [(user1, user3),(user2, user4)]
friendships9 = [(user1, user3),(user3, user2)]
friendships10 = [(user1, user3),(user3, user4),(user4, user5),(user5, user7),(user2, user5)]
friendships11 = [(user4,user3),(user4,user5),(user4,user7),(user4,user1),(user4,user10), (user2,user4),(user6,user4),(user8,user4),(user9,user4),(user10,user4),(user11,user4),(user4, user13)]
friendships12 = [(user5,user1)]
friendships13 = [(user1, user3),(user4,user3),(user4,user1)]
friendships14 = [(user2,user1),(user4,user2),(user9,user4),(user1,user9)]
friendships15 = [(user7, user4),(user3,user1),(user4,user10),(user1,user11),(user11,user10)]
friendships16 = [(user3,user2),(user1,user2),(user4,user3),(user1,user7)]

-- Posts
posts1 = [(user3, "", []),(user5,"Descripcion",[user3]), (user10, "",[]),(user9,"Nueva publicacion",[user3])]
posts2 = [(user3, "", []),(user3,"Hola",[user2]),(user3, "Chau", [user3,user9]), (user4, "", [])]
posts3 = [(user1,"",[user5,user2,user1]),(user10, "Descripción random",[user10,user2,user1]), (user1,"Testeo",[user2,user1]), (user5, "Publicación",[user1])]
posts4 = [(user2,"",[user2]),(user3,"",[user3]),(user7,"Nueva publicacion",[user3]), (user5, "",[user5, user10]), (user5, "Hola",[user5,user10]),(user13,"Post",[])]
posts5 = [(user3, "", []),(user3,"Hola",[user2]),(user3, "Chau", [user3,user9]), (user4, "", []), (user4, "Pub2",[]), (user4, "Pub3",[]), (user4, "Pub4",[])]
posts6 = [(user3, "", [user9,user3]),(user3,"Hola",[user2,user3,user9]),(user3, "Chau", [user3,user9]), (user4, "", [])]
posts7 = [(user3, "", [user3]),(user3,"Hola",[user2,user3,user9]),(user3, "Chau", [user3,user9]), (user4, "", [])]

-- Social Network 
socialNetwork0 = (usersList0,[],[])
socialNetwork1 = ([],[],[])
socialNetwork2 = (usersList1, [], [])
socialNetwork3 = (usersList2, friendships2, [])
socialNetwork4 = (usersList4, [], [])
socialNetwork5 = (usersList5, [], [])
socialNetwork6 = (usersList1, friendships1, [])
socialNetwork7 = (usersList3, friendships3, [])
socialNetwork8 = (usersList1, friendships4, [])
socialNetwork9 = (usersList6, friendships6, posts1)
socialNetwork10 = (usersList1, friendships1, posts1)
socialNetwork11 = (usersList3,[], posts2)
socialNetwork12 = (usersList3, [], posts3)
socialNetwork13 = (usersList6, [], posts4)
socialNetwork14 = (usersList1, friendships7, [])
socialNetwork15 = (usersList1, friendships3, [])
socialNetwork16 = (usersList1, [], [])
socialNetwork17 = (usersList1, friendships8, [])
socialNetwork18 = (usersList1, friendships9, [])
socialNetwork19 = (usersList1, friendships10, [])
socialNetwork20 = (usersList6, friendships11, posts6)
socialNetwork21 = (usersList3, [], posts5)
socialNetwork22 = (usersList6, friendships11, posts7)
socialNetwork23 = (usersList4, friendships12,[])
socialNetwork24 = (usersList1, friendships5, [])
socialNetwork25 = (usersList1, friendships13, [])
socialNetwork26 = (usersList1, friendships14, [])
socialNetwork27 = (usersList1, friendships15, [])
socialNetwork28 = (usersList1, friendships16, [])

--test suites for exercise 1
testssuites1 = test [
  "Empty user list" ~: (usersNames socialNetwork1) ~?= [],
  "List with more than two users with distinct and repeated names (even count)" ~: (usersNames socialNetwork2) ~?= ["Lucas","Natalia",".","Juan","!","Mateo","Nicolas","Ludmila","[]"],
  "List with more than two users with distinct names (odd count)" ~: (usersNames socialNetwork3) ~?= [".","Juan","[]"],
  "List with repeated names" ~: (usersNames socialNetwork4) ~?= ["Juan"],
  "List with a single user" ~: (usersNames socialNetwork5) ~?= ["Ludmila"]
 ]

--test suites for exercise 2
testssuites2 = test [
  "There is only one user in the social network" ~: (friendsOf socialNetwork0 user1) ~?= [],
  "User without friends" ~: (friendsOf socialNetwork2 user1) ~?= [],
  "User with two friends" ~: (friendsOf socialNetwork3 user4) ~?= [user5, user10],
  "User with more than two friends (odd count)" ~: (friendsOf socialNetwork6 user2) ~?= [user1, user3, user9],
  "User with only one friend" ~: (friendsOf socialNetwork7 user1) ~?= [user2],
  "User with more than two friends (even count)" ~: (friendsOf socialNetwork8 user7) ~?= [user1, user9, user10, user3, user5, user4]
 ]

--test suites for exercise 3
testssuites3 = test [
  "There is only one user in the social network" ~: (numberOfFriends socialNetwork0 user1) ~?= 0,
  "User without friends" ~: (numberOfFriends socialNetwork2 user1) ~?= 0,
  "User with two friends" ~: (numberOfFriends socialNetwork3 user4) ~?= 2,
  "User with more than two friends (odd count)" ~: (numberOfFriends socialNetwork6 user2) ~?= 3,
  "User with only one friend" ~: (numberOfFriends socialNetwork7 user1) ~?= 1,
  "User with more than two friends (even count)" ~: (numberOfFriends socialNetwork8 user7) ~?= 6
 ]

--test suites for exercise 4
testssuites4 = test [
  "There is only one user in the social network" ~: expectAny (mostPopularUser socialNetwork0) [user1],
  "No one has friends" ~: expectAny (mostPopularUser socialNetwork2) [user1,user2,user3,user4,user5,user6,user7,user8,user9,user10],
  "Three users with the maximum number of friends (odd count)" ~: expectAny (mostPopularUser socialNetwork3) [user4,user5,user10],
  "Two users with the maximum number of friends (even count)" ~: expectAny (mostPopularUser socialNetwork7) [user2,user1],
  "Only one user with the maximum number of friends" ~: expectAny (mostPopularUser socialNetwork8) [user7],
  "All users have the same number of friends" ~: expectAny (mostPopularUser socialNetwork23) [user1,user5]
 ]

--test suites for exercise 5
testssuites5 = test [
  "No one has friends" ~: (isRobertoCarlos socialNetwork2) ~?= False,
  "Everyone has only 2 friends" ~: (isRobertoCarlos socialNetwork3) ~?= False,
  "Empty social network (no users)" ~: (isRobertoCarlos socialNetwork1) ~?= False,
  "The most popular user has 6 friends" ~: (isRobertoCarlos socialNetwork8) ~?= False,
  "The most popular user has 11 friends (odd count)" ~: (isRobertoCarlos socialNetwork9) ~?= True,
  "The most popular user has 12 friends (even count)" ~: (isRobertoCarlos socialNetwork20) ~?= True
 ]

--test suites for exercise 6
testssuites6 = test [
  "My user has only one post" ~: (postsOf socialNetwork10 user3) ~?= [(user3, "", [])],
  "My user has no posts" ~: (postsOf socialNetwork2 user4) ~?= [],
  "My user has more than two posts (odd count)" ~: (postsOf socialNetwork11 user3) ~?= [(user3, "", []),(user3,"Hola",[user2]),(user3, "Chau", [user3,user9])],
  "My user has more than two posts (even count)" ~: (postsOf socialNetwork21 user4) ~?= [(user4, "", []),(user4, "Pub2",[]), (user4, "Pub3",[]), (user4, "Pub4",[])],
  "My user has two posts" ~: (postsOf socialNetwork12 user1) ~?= [(user1,"",[user5,user2,user1]), (user1,"Testeo",[user2,user1])]
 ]

--test suites for exercise 7
testssuites7 = test [
  "My user likes two posts" ~: (postsUserLikes socialNetwork10 user3) ~?= [(user5,"Descripcion",[user3]), (user9,"Nueva publicacion",[user3])],
  "My user doesn't like any posts" ~: (postsUserLikes socialNetwork10 user1) ~?= [],
  "My user likes only one post and it's not theirs" ~: (postsUserLikes socialNetwork11 user2) ~?= [(user3,"Hola",[user2])],
  "My user likes more than two posts (even count)" ~: (postsUserLikes socialNetwork12 user1) ~?= [(user1,"",[user5,user2,user1]),(user10, "Descripción random",[user10,user2,user1]), (user1,"Testeo",[user2,user1]), (user5, "Publicación",[user1])],
  "My user likes only one post and it's their own post" ~: (postsUserLikes socialNetwork12 user10) ~?= [(user10, "Descripción random",[user10,user2,user1])],
  "My user likes more than two posts (odd count)" ~: (postsUserLikes socialNetwork12 user2) ~?= [(user1,"",[user5,user2,user1]),(user10, "Descripción random",[user10,user2,user1]), (user1,"Testeo",[user2,user1])]
 ]

--test suites for exercise 8
testssuites8 = test [
  "Neither of the two users likes any post" ~: (likesTheSamePosts socialNetwork10 user5 user9) ~?= True,
  "Both users like only one post and it's the same" ~: (likesTheSamePosts socialNetwork11 user3 user9) ~?= True,
  "Both users like more than two posts and they are the same" ~: (likesTheSamePosts socialNetwork20 user9 user3) ~?= True,
  "Both users like only one post and it's different" ~: (likesTheSamePosts socialNetwork12 user5 user10) ~?= False,
  "One user likes only one post and the other likes two" ~: (likesTheSamePosts socialNetwork13 user3 user2) ~?= False,
  "Both users like more than two posts and they are different" ~: (likesTheSamePosts socialNetwork22 user3 user9) ~?= False
 ]

--test suites for exercise 9
testssuites9 = test [
  "My user has no posts" ~: (existsLoyalFollower socialNetwork13 user10) ~?= False,
  "My user has only one post that has a like from someone else" ~: (existsLoyalFollower socialNetwork10 user9) ~?= True,
  "My user doesn't have likes on all their posts (odd count)" ~: (existsLoyalFollower socialNetwork11 user3) ~?= False,
  "My user has only one post that has no likes" ~: (existsLoyalFollower socialNetwork13 user13) ~?= False,
  "My user has only one post and the only like it has is their own" ~: (existsLoyalFollower socialNetwork13 user2) ~?= False,
  "My user has posts that have likes from themselves and someone else (even count)" ~: (existsLoyalFollower socialNetwork13 user5) ~?= True
 ]

-- Test suites for exercise 10
testssuites10 = test [
  "The users are friends" ~: (existsSequenceOfFriends socialNetwork10 user1 user2) ~?= True,
  "The users are connected through a mutual friend" ~: (existsSequenceOfFriends socialNetwork10 user1 user3) ~?= True,
  "There are no friendships" ~: (existsSequenceOfFriends socialNetwork2 user3 user4) ~?= False,
  "The users have no friends" ~: (existsSequenceOfFriends socialNetwork7 user3 user4) ~?= False,
  "The users have no common path to connect" ~: (existsSequenceOfFriends socialNetwork17 user1 user2) ~?= False,
  "The users have a common path to connect" ~: (existsSequenceOfFriends socialNetwork19 user1 user2) ~?= True,
  "The user is connected to themselves (indirect path in friendships)" ~: (existsSequenceOfFriends socialNetwork24 user3 user3) ~?= True,
  "The user is not connected to themselves (direct path in friendships)" ~: (existsSequenceOfFriends socialNetwork23 user1 user1) ~?= False,
  "The user is connected to themselves (direct path in friendships)" ~: (existsSequenceOfFriends socialNetwork25 user1 user1) ~?= True,
  "The user is not connected to themselves (indirect path in friendships)" ~: (existsSequenceOfFriends socialNetwork27 user1 user1) ~?= False
 ]


expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)