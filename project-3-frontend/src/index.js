let CURRENT_USER = '';

document.addEventListener('DOMContentLoaded', function(){
    while(CURRENT_USER == ''){
        signIn();
    }
    fetchUser(CURRENT_USER);
    document.querySelector('#new-post-submit').addEventListener('click', function(e) {
        e.preventDefault();
        //console.log(e.target.parentNode.caption.value)
        if(e.target.parentNode.parentNode.url.value != '' && e.target.parentNode.parentNode.url.value) {
            submitPost(e.target.parentNode.parentNode);
        } else {
            alert("Please enter a valid URL")
        }
    })

    document.querySelector('.nav-post-btn').addEventListener('click', function() {
        document.querySelector('#new-post').classList.toggle('hidden');
    })
})

function signIn() {
    var person = prompt("Please enter your name", "Your Name Here");
    if (person != null) {
      CURRENT_USER = person;
      document.querySelector('.nav-user').innerHTML = `<a><i class="fas fa-user"></i> ${person}</a>`
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
    .then(data => {
        let sorted = data.sort(function(a, b) {return a.id - b.id})
        sorted.forEach(post => {
        renderImage(post);
        })
    })
    
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
    img.setAttribute('class', 'tile-img')
    img.src = post.src;
    let user = document.createElement('p');
    // user.innerHTML = `Posted By: ${post.user.username}`;
    let likes = document.createElement('p');
    let i = document.createElement('i');
    likes.setAttribute('class', 'likes');
    i.setAttribute('class','fas fa-bread-slice')
    i.setAttribute('style','color:black;')
    likes.append(i, ` ${post.likes}`);
    likes.addEventListener('click', function(){
        if(i.style.color == 'sandybrown'){
            handleUnlike(post);
            likes.innerHTML = '';
            i.setAttribute('style','color:black;');
            likes.append(i, ` ${post.likes}`);
        } else if (i.style.color == 'black'){
            handleLike(post);
            likes.innerHTML = '';
            i.setAttribute('style','color:sandybrown;');
            likes.append(i, ` ${post.likes + 1}`);
        }
    })

    //right side with caption and comments
    let rightDiv = document.createElement('div');
    rightDiv.setAttribute('class', 'right-div');
    let commentDiv = document.createElement('div');
    commentDiv.setAttribute('class', 'comment-div');
    let commentSection = document.createElement('ul');
    commentSection.setAttribute('id',`comments-${post.id}`)
    commentSection.setAttribute('class', 'comment-list');   
    let caption = document.createElement('li');
    caption.setAttribute('id', `posted-by-${post.id}`);
    caption.innerHTML = `<i class="fas fa-user-circle"></i> <strong>Posted: </strong> <br>${post.caption}`;
    commentSection.appendChild(caption);
    if(post.comments){
        post.comments.forEach(comment => {
            let li = document.createElement('li');
            li.innerHTML = `<i class="fas fa-user-circle"></i> Comment: <br>${comment.content}`;
            commentSection.appendChild(li);
        })
    }
    let input = document.createElement('textarea');
    input.setAttribute('type','text');
    input.setAttribute('placeholder', 'Share your thoughts...')
    let submitBtn = document.createElement('button');
    submitBtn.setAttribute('class', 'comment-btn');
    submitBtn.innerHTML = '<i class="far fa-comment-dots"></i> Comment';
    submitBtn.addEventListener('click', function(){
        submitComment(input.value, post);
        input.value = "";
    })
    infoDiv.append(user, likes);
    commentDiv.append(commentSection);
    rightDiv.append(commentDiv, input, submitBtn);
    leftDiv.append(img,infoDiv)
    topDiv.append(leftDiv, rightDiv);
    feed.append(topDiv);
}

function submitComment(comment, post){
    fetch('http://localhost:3000/comments', {
        method: 'POST',
        headers: {
            "Content-Type": "Application/JSON"
        },
        body: JSON.stringify({
            user: CURRENT_USER,
            post: post,
            content: comment
        })
    })
    .then(res => res.json())
    .then(data => {
        let commentSection = document.querySelector(`#comments-${post.id}`)
        let li = document.createElement('li');
        li.innerHTML = data.content;
        commentSection.appendChild(li);
    })
}

function handleUnlike(post){
    fetch(`http://localhost:3000/posts/${post.id}`,{
        method: 'PATCH',
        headers: {
            "Content-Type": "Application/JSON",
            "Accept": "Application/JSON"
        },
        body: JSON.stringify({
            likes: post.likes
        })
    })
    .then(res => res.json())
    .then(data => {
        console.log(data)
    })
}

function handleLike(post){
    fetch(`http://localhost:3000/posts/${post.id}`,{
        method: 'PATCH',
        headers: {
            "Content-Type": "Application/JSON",
            "Accept": "Application/JSON"
        },
        body: JSON.stringify({
            likes: post.likes + 1
        })
    })
    .then(res => res.json())
    .then(data => {
        console.log(data)
    })
}

function submitPost(form){
    fetch('http://localhost:3000/posts', {
        method: 'POST',
        headers: {
            "Content-Type": "Application/JSON"
        },
        body: JSON.stringify({
            src: form.url.value,
            caption: form.text.value,
            likes: 0,
            user: CURRENT_USER
        })
    })
    .then(res => res.json())
    .then(data => {
        renderImage(data);
        form.url.value = ''
        form.text.value = ''
    })
}