# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

src1 = "https://i.imgur.com/b6LDIZS.jpg";
src2 = "https://i.imgur.com/kS4Hdvj.jpg";
src3 = "https://i.imgur.com/BicbmTY.jpg";
src4 = "https://i.imgur.com/ofg651y.jpg";
src5 = "https://i.imgur.com/2qUN1ml.jpg";
src6 = "https://i.imgur.com/CjYtOwA.jpg";
src7 = "https://i.imgur.com/gws8OiS.jpg";
src8 = "https://i.imgur.com/TiQYVU5.jpg";
src9 = "https://i.imgur.com/akTAOZq.jpg";
src10 = "https://i.imgur.com/LEMpUxA.jpg";
src11 = "https://i.imgur.com/q8RIEzq.png";
src12 = "https://i.imgur.com/KliicKw.jpg";
src13 = "https://i.imgur.com/9xQTkFX.jpg";
src14 = "https://i.imgur.com/28zsEqv.jpg";
src15 = "https://i.imgur.com/pzCOMnH.jpg";
src16 = "https://i.imgur.com/dVnLHJ3.jpg";
src17 = "https://i.imgur.com/9WnNMLI.jpg";
src18 = "https://i.imgur.com/pmm3Fc7.jpg";
src19 = "https://i.imgur.com/pH2reUP.jpg";
src20 = "https://i.imgur.com/vGtJ1PW.jpg";
src21 = "https://i.imgur.com/hxOHgLc.jpg";
src22 = "https://i.imgur.com/13MP0on.jpg";
src23 = "https://i.imgur.com/9Cu6jH6.jpg";
src24 = "https://i.imgur.com/rNNSmfg.jpg";
src25 = "https://i.imgur.com/SybHUJA.jpg";
src26 = "https://i.imgur.com/XkZogSn.jpg";
src27 = "https://i.imgur.com/iyY3eiU.jpg";
src28 = "https://i.imgur.com/bwzh021.jpg";
src29 = "https://i.imgur.com/cHaNK3Z.jpg";
src30 = "https://i.imgur.com/gTe5JPS.jpg";

user1 = User.create(username: "sandwichlover123");
user2 = User.create(username: "bob");
user3 = User.create(username: "loafman_74");
user4 = User.create(username: "loafitorlistit");
user5 = User.create(username: "mrbreadman");

post1 = Post.create(src: src1, caption: "With caramlized onions on top!",  user: user1);
post2 = Post.create(src: src2, caption: "Bacon Ice Cream Sandwich with Strawbebby Sauce Bone Apple Teeth",  user: user1);
post3 = Post.create(src: src3, caption: "Me gusta este comida." , user: user5);
post4 = Post.create(src: src4, caption: "Delcious!" , user: user4);
post5 = Post.create(src: src5, caption: "unit",  user: user1);
post6 = Post.create(src: src6, caption: "the reubenist",  user: user1);
post7 = Post.create(src: src7, caption: "dark sandwich",  user: user1);
post8 = Post.create(src: src8, caption: "babadook dook dook",  user: user1);
post9 = Post.create(src: src9, caption: "SNACC WRAP LOOKIN LIKE A FULL MEAL!! !",  user: user1);
post10 = Post.create(src: src10, caption: "excellence",  user: user1);
post11 = Post.create(src: src11, caption: "I made a peanut butter and jelly sandwich today." , user: user1);
post12 = Post.create(src: src12, caption: "classic",  user: user3);
post13 = Post.create(src: src13, caption: "long tomatoe",  user: user3);
post14 = Post.create(src: src14, caption: "Norwegian lunch for today!",  user: user3);
post15 = Post.create(src: src15, caption: "Life's a party and I'm the pinata",  user: user1);
post16 = Post.create(src: src16, caption: "breakfast lunch and dinners for beginners",  user: user3);
post17 = Post.create(src: src17, caption: "Is a hot dog a sandwich? Is a hot dog making hot dogs a sandwich? I scream because I do not know.",  user: user1);
post18 = Post.create(src: src18, caption: "CHEETOE KFC SAMMICH ALL NEW GET TO UR LOCAL KFC TODAY",  user: user4);
post19 = Post.create(src: src19, caption: "Pretzle bun is for casuals. Straight pretzle bro!",  user: user4);
post20 = Post.create(src: src20, caption: "English breakfast sandwich!",  user: user5);
post21 = Post.create(src: src21, caption: "Popeyes Chicken sandwich wasnt as great as I had hoped.",  user: user1);
post22 = Post.create(src: src22, caption: "Microwaved to perfection." , user: user3);
post23 = Post.create(src: src23, caption: "borger",  user: user3);
post24 = Post.create(src: src24, caption: "bfast wrap too fast for be",  user: user3);
post25 = Post.create(src: src25, caption: "Awesome sandwich I made.",  user: user4);
post26 = Post.create(src: src26, caption: "Check out this BLT!" , user: user1);
post27 = Post.create(src: src27, caption: "BLT for me.",  user: user5);
post28 = Post.create(src: src28, caption: "Oh yess.",  user: user3);
post29 = Post.create(src: src29, caption: "long boy is long",  user: user1);
post30 = Post.create(src: src30, caption: "publix sandwich",  user: user4);


comment1 = Comment.create(content: "Microwaved? What are you even doing?", user: user2, post: post22);
comment2 = Comment.create(content: "Hell yeah it's best that way.", user: user1, post: post22);
comment3 = Comment.create(content: "No way thats gross. Plus a poptart isnt a sandwich.", user: user2, post: post22);
comment4 = Comment.create(content: "Uh yeah it is dummy face", user: user1, post: post22);
comment5 = Comment.create(content: "Prepare for a knuckle sandwich nerd", user: user2, post: post22);
comment6 = Comment.create(content: "Aight bet", user: user1, post: post22);

like1 = Like.create(user: user2, post: post1)
like2 = Like.create(user: user3, post: post1)
like3 = Like.create(user: user2, post: post2)