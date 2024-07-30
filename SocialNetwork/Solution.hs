module Solution where

-- Data types
type User = (Integer, String) -- (Id, name)
type Friendship = (User, User) -- Users who are friends
type Post = (User, String, [User]) -- (Post's creator, Post's text, Users who like the post)
type SocialNetwork = ([User], [Friendship], [Post])

-- Basic functions
users :: SocialNetwork -> [User]
users (us, _, _) = us

friendships :: SocialNetwork -> [Friendship]
friendships (_, rs, _) = rs

posts :: SocialNetwork -> [Post]
posts (_, _, ps) = ps

userId :: User -> Integer
userId (id, _) = id

userName :: User -> String
userName (_, nombre) = nombre

postCreator :: Post -> User
postCreator (u, _, _) = u

postLikes :: Post -> [User]
postLikes (_, _, us) = us

createUser :: Integer -> String -> User
createUser n p = (n,p)

----------------------------------------------------------------------------------------

-- This function returns all the users' names in the social network without any repetitions.
usersNames :: SocialNetwork -> [String] 
usersNames socialNetwork = removeRepetitions (getNamesOfUsers usersSocialNetwork) 
    where usersSocialNetwork = users socialNetwork

getNamesOfUsers :: [User] -> [String]
getNamesOfUsers [] = [] 
getNamesOfUsers (x:xs) = userName x : getNamesOfUsers xs

-- This function returns a list of all the friends of a given user.
friendsOf :: SocialNetwork -> User -> [User] 
friendsOf socialNetwork user = getFriendsOf socialNetworkFriendships user
    where socialNetworkFriendships = friendships socialNetwork

getFriendsOf :: [Friendship] -> User -> [User]
getFriendsOf [] _ = [] -- If there are no friendships in my social network, return an empty list.
getFriendsOf (x:xs) user
 | fst x == user = snd x : getFriendsOf xs user -- If the first person of the friendship is my user, then add the second. 
 | snd x == user = fst x : getFriendsOf xs user -- If the second person of the friendship is my user, then add the first.
 | otherwise = getFriendsOf xs user -- If my user isn't part of the friendship, then don't add these users.s

-- This function returns the number of friends of a given user.
numberOfFriends :: SocialNetwork -> User -> Int 
numberOfFriends socialNetwork user = listLength(friendsOf socialNetwork user) 

-- This functions return the User with the highest number of friends in the social network.
-- We suppose that there is at least one user in the social network.
mostPopularUser :: SocialNetwork -> User 
mostPopularUser socialNetwork = calculateMostPopularUser socialNetwork xs x 
  where x:xs = users socialNetwork

-- This function calculates the most popular user in the social network comparing every iteration with a given user.
calculateMostPopularUser :: SocialNetwork -> [User] -> User -> User 
calculateMostPopularUser socialNetwork [] user = user -- If there aren't any users, the user given is the most popular.
calculateMostPopularUser socialNetwork (x:xs) user
        | numberOfFriends socialNetwork user > numberOfFriends socialNetwork x = calculateMostPopularUser socialNetwork xs user -- If the head of the users has less friends that the given user, I keep the candidate user.
        | otherwise = calculateMostPopularUser socialNetwork xs x -- Otherwise, I update the candidate user with the head of the list. 

-- This function checks if there is a user who has 10 friends or more
isRobertoCarlos :: SocialNetwork -> Bool 
isRobertoCarlos ([],[],[]) = False -- If I don't have users in my social network, then returns false.
isRobertoCarlos redSocial = numberOfFriends redSocial celebrity > 10 -- I check if the most popular user in the social network has more than 10 friends.
  where celebrity = mostPopularUser redSocial 

-- This functions returns a list of posts of a given user.
postsOf :: SocialNetwork -> User -> [Post] 
postsOf socialNetwork user = getPostsOf socialNetWorkPosts user
    where socialNetWorkPosts = posts socialNetwork

getPostsOf :: [Post] -> User -> [Post]
getPostsOf [] user = [] 
getPostsOf (x:xs) user
 | creator == user = x : getPostsOf xs user -- If the current post has my user as the creator, I add it.
 | otherwise = getPostsOf xs user -- Otherwise, ignore the user.
    where creator = first x

-- This function returns a list of posts that the user likes
postsUserLikes :: SocialNetwork -> User -> [Post] 
postsUserLikes socialNetwork user = getPostsUserLikes socialNetWorkPosts user
    where socialNetWorkPosts = posts socialNetwork

getPostsUserLikes :: [Post] -> User -> [Post]
getPostsUserLikes [] user = [] 
getPostsUserLikes (x:xs) user
 | belongs user postLikes = x : getPostsUserLikes xs user -- If my user likes the post, I add it.
 | otherwise = getPostsUserLikes xs user -- Otherwise, I don't add it.
    where postLikes = third x

-- This function checks if two users like the same posts.
likesTheSamePosts :: SocialNetwork -> User -> User -> Bool 
likesTheSamePosts (_,_,[]) user1 user2 = True -- If I don't have posts, they share the same likes.
likesTheSamePosts socialNetwork user1 user2 = included likesUser1 likesUser2 && included likesUser2 likesUser1 -- They likes the same posts if and only if the likes of the first user are included in the likes of the second and vice versa.
  where likesUser1 = postsUserLikes socialNetwork user1
        likesUser2 = postsUserLikes socialNetwork user2

-- This function checks if there is a user who likes all the posts of the given user.
existsLoyalFollower :: SocialNetwork -> User -> Bool 
existsLoyalFollower socialNetwork user = checkIfExistsLoyalFollower socialNetwork usersList userPosts user
  where userPosts = postsOf socialNetwork user
        usersList = users socialNetwork

checkIfExistsLoyalFollower :: SocialNetwork -> [User] -> [Post] -> User -> Bool
checkIfExistsLoyalFollower _ [] _ _ = False -- If there are no users left, it means that there isn't a loyal follower. 
checkIfExistsLoyalFollower _ _ [] _ = False -- If my user doesn't have any post, it means that there isn't a loyal follower.
checkIfExistsLoyalFollower socialNetwork (x:xs) posts user = (x /= user && included posts likesOfUser) || rec socialNetwork xs posts user -- Check if the posts of my user are liked in the current user. In addition, I check that this follower isn't the author of the posts.
  where likesOfUser = postsUserLikes socialNetwork x
        rec = checkIfExistsLoyalFollower 

-- This function checks if there is a sequence of friends which starts on user1 and finish on user2.
existsSequenceOfFriends :: SocialNetwork -> User -> User -> Bool 
existsSequenceOfFriends socialNetwork user1 user2 = belongs user2 (friendsTree socialNetwork user1 (sortFriendships socialNetwork user1 rels)) -- I check if user2 belongs to the tree of friends of the user1.
  where rels = friendships socialNetwork

friendsTree :: SocialNetwork -> User -> [Friendship] -> [User]
friendsTree redSocial user [] = [] -- If I don't have friendships in my network, I return the empty list.
friendsTree redSocial user (x:xs)
  | user == fst x = snd x : friendsTree redSocial user (sortFriendships redSocial user xs) ++ friendsTree redSocial (snd x) (sortFriendships redSocial (snd x) xs)
  | user == snd x = fst x : friendsTree redSocial user (sortFriendships redSocial user xs) ++ friendsTree redSocial (fst x) (sortFriendships redSocial (fst x) xs)
  | otherwise = friendsTree redSocial user xs -- Since I have sorted the friendships to have first the friends of my given user, I don't delete potential users for later.

-- This function sort the friendships of the social network to have friends of my given user first.
sortFriendships :: SocialNetwork -> User -> [Friendship] -> [Friendship] 
sortFriendships socialNetwork user [] = [] 
sortFriendships socialNetwork user (x:xs)
 | fst x == user || snd x == user = x : sortFriendships socialNetwork user xs
 | otherwise = sortFriendships socialNetwork user xs ++ [x] 

-- Auxiliary functions
listLength :: [t] -> Int 
listLength [] = 0
listLength (x:xs) = 1 + listLength xs

belongs :: Eq t => t -> [t] -> Bool 
belongs _ [] = False
belongs y (x:xs) | x == y = True
                   | otherwise = belongs y xs

first :: (t,x,z) -> t
first (a,b,c) = a

third :: (t,x,z) -> z 
third (a,b,c) = c

included :: Eq t => [t] -> [t] -> Bool 
included [] _ = True
included (x:xs) y = belongs x y && included xs y

sameSet :: Eq t => [t] -> [t] -> Bool 
sameSet u v = included u v && included v u

removeRepetitions :: Eq a => [a] -> [a] 
removeRepetitions [] = []
removeRepetitions (x:xs) | belongs x xs = removeRepetitions xs
                         | otherwise = x : removeRepetitions xs


 