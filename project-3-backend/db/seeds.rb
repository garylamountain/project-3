# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

src1 = "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjuraKJ163lAhUWrZ4KHY0kCRgQjRx6BAgBEAQ&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FPeanut_butter_and_jelly_sandwich&psig=AOvVaw27_buCklxBdW2nL11TVQWa&ust=1571758564481478";
src2 = "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwifsdeW163lAhUXoZ4KHcq7DU8QjRx6BAgBEAQ&url=https%3A%2F%2Fwww.reddit.com%2Fr%2Fseriouseats%2Fcomments%2F9dnqfj%2Fultimate_bltsimple_but_exquisite%2F&psig=AOvVaw3gvhWVPIz-zjdACQyhEHKJ&ust=1571758591207111";
src3 = "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiV8tOq163lAhWHqp4KHYVDArIQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.reddit.com%2Fr%2Ffood%2Fcomments%2F8muues%2Fhomemade_cuban_sandwich_with_14_hour_smoked_pork%2F&psig=AOvVaw3iBYKu5rBlDrJrNey206Dr&ust=1571758632447544";
src4 = "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiG1KO6163lAhXV7Z4KHcCbCnAQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.reddit.com%2Fr%2Fmildlyinteresting%2Fcomments%2F6locqe%2Fthis_icecream_sandwich_came_with_an_extra_half%2F&psig=AOvVaw0SqSL4Kpd5D2Gr8wXkaKiJ&ust=1571758665998053";
src5 = "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwimlfbG163lAhXGo54KHWg4AxgQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.reddit.com%2Fr%2Fmildlyinfuriating%2Fcomments%2Fcq8niw%2Fmy_pop_tart_is_cracked_and_has_weak_frosting_game%2F&psig=AOvVaw1VVG1tue81NCdfIJKW_pjh&ust=1571758690344448";

user1 = User.create(username: "sandwichlover123");
user2 = User.create(username: "bob");
user3 = User.create(username: "loafman_74");

post1 = Post.create(src: src1, caption: "I made a peanut butter and jelly sandwich today." ,likes: 0, user: user1);
post2 = Post.create(src: src2, caption: "Check out this BLT!" ,likes: 0, user: user1);
post3 = Post.create(src: src3, caption: "Me gusta este cubano." ,likes: 0, user: user2);
post4 = Post.create(src: src4, caption: "Delcious!" ,likes: 0, user: user2);
post5 = Post.create(src: src5, caption: "Microwaved to perfection." ,likes: 0, user: user3);

comment1 = Comment.create(content: "Microwaved? What are you even doing?", user: user2, post: post5);