let CURRENT_USER = '';

document.addEventListener('DOMContentLoaded', function(){
    while(CURRENT_USER == ''){
        signIn();
    }
    fetchUser(CURRENT_USER);
})

function signIn() {
    var person = prompt("Please enter your name", "Your Name Here");
    if (person != null) {
      CURRENT_USER = person;
    }
}

function fetchUser(username){
    fetch('http://localhost:3000/users')
    .then(res => res.json())
    .then(data => {
        data.forEach(user => {
        if(user.username == CURRENT_USER){
            CURRENT_USER = user;
            fetchAllPosts();
        }
        })
        if(typeof CURRENT_USER == "string"){
            fetch('http://localhost:3000/users', {
                method: 'POST',
                headers: {
                    "Content-Type": "Application/JSON"
                },
                body: JSON.stringify({username: CURRENT_USER})
            })
            .then(res => res.json())
            .then(data => {
                CURRENT_USER = data;
                fetchAllPosts();
            })
        }
    })
}

function fetchAllPosts(){
    let h = document.querySelector('#greeting');
    h.innerHTML = `Let's get this bread, ${CURRENT_USER.username}!`;
    fetch('http://localhost:3000/posts')
    .then(res => res.json())
    .then(data => data.forEach(post => {
        renderImage(post);
    })
    )
}

function renderImage(post){
    let feed = document.querySelector('#feed');
    
    let topDiv = document.createElement('div');
    topDiv.setAttribute('class', 'tile');
    let captionDiv = document.createElement('div');
    captionDiv.setAttribute('class', 'caption-div');
    captionDiv.setAttribute('id',`caption-div-${post.id}`);
    let commentDiv = document.createElement('div');
    commentDiv.setAttribute('class', 'comment-div');

    let img = document.createElement('img');
    let caption = document.createElement('p');
    caption.setAttribute('class', 'cap');

    let commentSection = document.createElement('ul');
    commentSection.setAttribute('class', 'comment-list');

    img.src = post.src;
    caption.innerHTML = post.caption;

    if(post.comments){
        post.comments.slice(0, 5).forEach(comment => {
        let li = document.createElement('li');
        li.innerHTML = comment.content;
        commentSection.appendChild(li);
    })
    }

    captionDiv.append(caption);
    commentDiv.append(commentSection);
    topDiv.append(img, captionDiv, commentDiv);
    feed.append(topDiv);

    fetchLikes(post);

}

function fetchLikes(post){
    let likes = document.createElement('p');
    let i = document.createElement('i');
    likes.setAttribute('class', 'likes');
    i.setAttribute('class','fas fa-bread-slice')
    likes.append(i, ` ${post.likes.length}`);
    if(post.likes.some(like => CURRENT_USER.id == like.user_id)){
        i.setAttribute('style','color:red;')
    } else {
        i.setAttribute('style','color:black;')
    }
    likes.addEventListener('click', function(){
        if(i.style.color == 'red'){
            i.setAttribute('style','color:black;')
            handleUnlike(post, likes, i);

        } else if (i.style.color == 'black'){
            i.setAttribute('style','color:red;')
            handleLike(post, likes, i);

        }
    })

    let captionDiv = document.getElementById(`caption-div-${post.id}`);
    captionDiv.append(likes);
}

function handleLike(post, likes, i){
    console.log('liked');
    fetch('http://localhost:3000/likes', {
        method: 'POST',
        headers: {
            'Content-Type': 'Application/JSON'
        },
        body: JSON.stringify({
            user: CURRENT_USER,
            post: post
        })
    })
    .then(res => res.json())
    .then(data => {

    })
    likes.innerHTML = '';
    i.setAttribute('style','color:red;')
    likes.append(i, ` ${parseInt(post.likes.length) + 1}`);
}

function handleUnlike(likes, i, post, data){
    if(i.style.color == 'red'){
    console.log('unliked');
    console.log(likes);
    console.log(i);
    console.log(post);
    console.log(data);
    let like = post.likes.find(like => CURRENT_USER.id == like.user_id);
    if(!like){
        like = data;
    }
    fetch(`http://localhost:3000/likes/${like.id}`, {
        method: 'DELETE',
        headers: {
            'Content-Type': 'Application/JSON'
        },
        body: JSON.stringify({
            id: like.id
        })
    })
    likes.innerHTML = '';
    i.setAttribute('style','color:black;')
    likes.append(i, ` ${parseInt(post.likes.length) - 1}`);
    }
}