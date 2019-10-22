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
    // let h = document.querySelector('#greeting');
    // h.innerHTML = `Let's get this bread, ${CURRENT_USER.username}!`;
    fetch('http://localhost:3000/posts')
    .then(res => res.json())
    .then(data => data.forEach(post => {
        renderImage(post);
    })
    )
}

function renderImage(post){
    let feed = document.querySelector('#feed');
    
    // tile card
    let topDiv = document.createElement('div');
    topDiv.setAttribute('class', 'tile');

    // left side with image and info
    let leftDiv = document.createElement('div');
    leftDiv.setAttribute('class', 'left-div')
    let infoDiv = document.createElement('div');
    infoDiv.setAttribute('class', 'info-div');
    let img = document.createElement('img');
    img.src = post.src;
    let user = document.createElement('p');
    user.innerHTML = `Posted By: Username`;
    let likes = document.createElement('p');
    likes.setAttribute('class', 'likes');
    likes.innerHTML = `<i class="fas fa-bread-slice"></i> ${post.likes.length}`;
    
    //right side with caption and comments
    let rightDiv = document.createElement('div');
    rightDiv.setAttribute('class', 'right-div');
    let caption = document.createElement('p');
    caption.setAttribute('class', 'cap');
    caption.innerHTML = post.caption;
    let commentDiv = document.createElement('div');
    commentDiv.setAttribute('class', 'comment-div');
    let commentSection = document.createElement('ul');
    commentSection.setAttribute('class', 'comment-list');    
    if(post.comments){
        post.comments.slice(0, 5).forEach(comment => {
            let li = document.createElement('li');
            li.innerHTML = comment.content;
            commentSection.appendChild(li);
        })
    }

    infoDiv.append(user, likes);
    commentDiv.append(commentSection);
    rightDiv.append(caption, commentDiv);
    leftDiv.append(img,infoDiv)
    topDiv.append(leftDiv, rightDiv);
    feed.append(topDiv);
}