document.addEventListener('DOMContentLoaded', function(){
    fetchPage()
})

function fetchPage(){
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
    let captionDiv = document.createElement('div')
    let commentDiv = document.createElement('div');

    let img = document.createElement('img');
    let caption = document.createElement('p');
    let likes = document.createElement('p');
    let commentSection = document.createElement('ul');

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