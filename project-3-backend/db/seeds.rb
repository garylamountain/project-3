# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

src = [
"https://i.imgur.com/b6LDIZS.jpg",
"https://i.imgur.com/kS4Hdvj.jpg",
"https://i.imgur.com/BicbmTY.jpg",
"https://i.imgur.com/ofg651y.jpg",
"https://i.imgur.com/2qUN1ml.jpg",
"https://i.imgur.com/CjYtOwA.jpg",
"https://i.imgur.com/gws8OiS.jpg",
"https://i.imgur.com/TiQYVU5.jpg",
"https://i.imgur.com/akTAOZq.jpg",
"https://i.imgur.com/LEMpUxA.jpg",
"https://i.imgur.com/q8RIEzq.png",
"https://i.imgur.com/KliicKw.jpg",
"https://i.imgur.com/9xQTkFX.jpg",
"https://i.imgur.com/28zsEqv.jpg",
"https://i.imgur.com/pzCOMnH.jpg",
"https://i.imgur.com/dVnLHJ3.jpg",
"https://i.imgur.com/9WnNMLI.jpg",
"https://i.imgur.com/pmm3Fc7.jpg",
"https://i.imgur.com/pH2reUP.jpg",
"https://i.imgur.com/vGtJ1PW.jpg",
"https://i.imgur.com/hxOHgLc.jpg",
"https://i.imgur.com/13MP0on.jpg",
"https://i.imgur.com/9Cu6jH6.jpg",
"https://i.imgur.com/rNNSmfg.jpg",
"https://i.imgur.com/SybHUJA.jpg",
"https://i.imgur.com/XkZogSn.jpg",
"https://i.imgur.com/iyY3eiU.jpg",
"https://i.imgur.com/bwzh021.jpg",
"https://i.imgur.com/cHaNK3Z.jpg",
"https://i.imgur.com/gTe5JPS.jpg",
"https://i.redd.it/qpdtqtl885u31.jpg",
"https://external-preview.redd.it/a6DuWEzdVDv7004xkUOOest7ibUJNs2PXEnGIOI6zFs.jpg?width=960&crop=smart&auto=webp&s=5237b7f89c92cf850a5fb6dd7c363dd6ec8ec3ea",
"https://preview.redd.it/hyho4dykl5u31.png?width=960&crop=smart&auto=webp&s=3dcd2feaa0acf49b5b58b5bfa0e5bceb0698f362",
"https://preview.redd.it/5mmoogxiqxq31.jpg?width=640&crop=smart&auto=webp&s=034986b3a995901b53701d962c12bf3270ae29ac",
"https://i.redd.it/etut0t49x4231.jpg",
"https://preview.redd.it/o9r1wrxh7lv11.jpg?width=640&crop=smart&auto=webp&s=3f677074199f8dbcd3a8d49b0e167da6606f6307",
"https://preview.redd.it/460i0tmi3p531.jpg?width=640&crop=smart&auto=webp&s=a83c061ca05d13d31bd1e9e5c81bc7378f036128",
"https://preview.redd.it/5isqlg26ida11.jpg?width=640&crop=smart&auto=webp&s=95a23e2a63f94dc95c57caf9b393205438d1b7b4",
"https://preview.redd.it/tpycxu9ky5r31.jpg?width=640&crop=smart&auto=webp&s=d7fef07b82095cf534d5a7a3cb6b40a71387cdd3",
"https://preview.redd.it/8o78sibjxan21.jpg?width=640&crop=smart&auto=webp&s=c1c894b68f54e79d60e5c82aea0a37e0ec13bde3",
"https://preview.redd.it/2se0oqnkl1v21.jpg?width=640&crop=smart&auto=webp&s=03b8a1442db5a0207b2a3f3a2044b17ac1523545",
"https://preview.redd.it/i14szy7gq4e21.jpg?width=640&crop=smart&auto=webp&s=00e168513a92782bbdb0d64f3063f9869648941d",
"https://preview.redd.it/1qi2dr6nkb821.jpg?width=640&crop=smart&auto=webp&s=4787791715233342a9e5d900696c35641a70e4fa",
"https://preview.redd.it/9jynojz04ko31.jpg?width=640&crop=smart&auto=webp&s=eade5b0f427d9643d6338f696812f8cfb405cf62",
"https://preview.redd.it/fzo6pjrbavs11.jpg?width=640&crop=smart&auto=webp&s=e9e630278f95dbe57888a9210167624f2c0414c5",
"https://preview.redd.it/ysg2lmiuffp31.jpg?width=640&crop=smart&auto=webp&s=4b12da8af9db305f921a562508b363e8d5ca6d2d",
"https://preview.redd.it/dvfed81czr321.jpg?width=640&crop=smart&auto=webp&s=602060635b91051af0dca4e28e972937955bd29a",
"https://preview.redd.it/lw65ndt75ig31.jpg?width=640&crop=smart&auto=webp&s=27bbaeca3a0678a1fc203f2088866f42cb0731ef",
"https://preview.redd.it/x3axvf4fw6321.jpg?width=640&crop=smart&auto=webp&s=68a5edb625f2d5f509f6ba994047306dda6cf0bb",
"https://preview.redd.it/q9u42iu0col31.jpg?width=640&crop=smart&auto=webp&s=45c706e0e214f3dccfe4f6381b1d3439bef07f12",
"https://preview.redd.it/nt6ol8lpoq931.jpg?width=640&crop=smart&auto=webp&s=c510c73171150f7985a24801b2d7807501ab39be",
"https://preview.redd.it/c3772g3ifln31.jpg?width=640&crop=smart&auto=webp&s=3f00e8e4966a21e6daadc9b6b746dacfcfaf8d64",
"https://preview.redd.it/f5uz5jxgq7531.jpg?width=640&crop=smart&auto=webp&s=931615b05f1eb18fc0e04d0a275e9306e8fdc6da",
"https://preview.redd.it/ygdw5ykzudb21.jpg?width=640&crop=smart&auto=webp&s=e721007cd999c522a5af6a466f6a83e8ba893379",
"https://preview.redd.it/ptdx2t2ynga31.jpg?width=640&crop=smart&auto=webp&s=f4866e1ae84aeac053ffdd1dfe9d4daa8efd65ea",
"https://preview.redd.it/smz3wwvi3cp21.jpg?width=640&crop=smart&auto=webp&s=befe854eb9a802a0cf3cc39b00a2c5d9e879b6bf",
"https://preview.redd.it/ekcyfz55ld221.jpg?width=640&crop=smart&auto=webp&s=ab35a19c26db8aad1f4858cefe8fc81fa8b760fc",
"https://preview.redd.it/6vxfg7nkd9o31.jpg?width=640&crop=smart&auto=webp&s=51581eb7927f5bbdcc016d59554da204690e7e68",
"https://preview.redd.it/lsda3p4d4uj31.jpg?width=640&crop=smart&auto=webp&s=5c1e908214b8b529d29c1f373582f63d6c73898c",
"https://shortyawards.imgix.net/entries/10th/d51d1bfe-af98-4030-8009-3fb13c6005d8.jpeg?auto=format&fit=clip&w=540&s=c9a72ab83da9b0ee70aba732fb57f48a"
]

users = []
25.times do 
    user = User.create(username: Faker::Internet.username);
    users << user
end

50.times do 
    postNum = rand(0..(src.length - 1))
    user = users[rand(0..(users.length - 1))]
    post = Post.create(src: src[postNum], caption: Faker::Food.description, user: user, likes: 0);
    rand(0.. 6).times do
        Comment.create(content: Faker::Hipster.sentence, user: users[rand(0..(users.length - 1))], post: post);
    end
    src.delete_at(postNum)
end