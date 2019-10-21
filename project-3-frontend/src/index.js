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
    let commentDiv = document.createElement('div');
    commentDiv.setAttribute('class', 'comment-div');

    let img = document.createElement('img');
    let caption = document.createElement('p');
    caption.setAttribute('class', 'cap');
    let likes = document.createElement('p');
    likes.setAttribute('class', 'likes');
    let commentSection = document.createElement('ul');
    commentSection.setAttribute('class', 'comment-list');

    img.src = post.src;
    caption.innerHTML = post.caption;
    likes.innerHTML = post.likes;

    if(post.comments){
        post.comments.slice(0, 5).forEach(comment => {
        let li = document.createElement('li');
        li.innerHTML = comment.content;
        commentSection.appendChild(li);
    })
    }
    

    captionDiv.append(caption, likes);
    commentDiv.append(commentSection);
    topDiv.append(img, captionDiv, commentDiv);
    feed.append(topDiv);
}