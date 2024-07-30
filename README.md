# University Projects
## Social Network

This project is a social network built using Haskell. The social network is defined based on users, posts, and friendships.

Users are represented as tuples containing an ID and a name, while posts consist of the author, the text of the post, and a list of users who liked the post. Friendships are represented as tuples containing two users.

The social network includes various functions to manage and interact with users, posts, and friendships. These functions are tested in the provided test suites.

### Functions

The main functions included in this project are:

- **existsSequenceOfFriends**: Determines if there is a sequence of friendships connecting two users.
- **usersNames**: Retrieves the names of all users in the social network.
- **friendsOf**: Lists the friends of a given user.
- **numberOfFriends**: Counts the number of friends a user has.
- **mostPopularUser**: Identifies the user with the most friends.
- **isRobertoCarlos**: Checks if there is a user with more than 10 friends.
- **postsOf**: Retrieves all posts made by a specific user.
- **postsUserLikes**: Lists all posts that a user has liked.
- **likesTheSamePosts**: Checks if two users like the same posts.
- **existsLoyalFollower**: Determines if a user has a loyal follower who likes all their posts.

In addition to these main functions, several auxiliary functions are defined within the project to manage various aspects of the social network, ensuring that everything is managed by the programmer.

### Usage

To use this project, you will need to have Haskell installed on your machine. You can load the tests by running the following command in the GHCi:

```haskell
:l Tests.hs
