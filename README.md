# API Blog

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.0.0
* Rails version 6.1.4
* application at [production](https://demo-api-blog.herokuapp.com/)

##### Registration:
````
POST /api/v1/sign_up
params {"email": "my.mail@com", "password": "without_secure_requirements"}
receive <secure_token>
````

````
POST /api/v1/sign_in
params {"email": "my.mail@com", "password": "<your_password>"}
put at request {Token <secure_token>} to Authorization header 
````
##### Article:
````
POST /api/v1/articles
params {"title": "My Title", "body": "<your_text_body>", "category": nil}
put at request {Token <secure_token>} to Authorization header 
<category> is optional parameter 
````

````
GET /api/v1/articles
get a list of all articles
````

````
GET /api/v1/articles/<id>
get article by <id>
````

````
DELETE /api/v1/articles/<id>
put at request {Token <secure_token>} to Authorization header 
destroy article by <id>
````

##### Comments:
````
GET /api/v1/articles/:article_id/comments
get a list of all comments
````

````
POST /api/v1/articles/:article_id/comments
put at request {Token <secure_token>} to Authorization header
{"body": "<your_comment>"}
````

````
GET /api/v1/articles/:article_id/comments/:id
get current comment by <id>
````

````
DELETE /api/v1/articles/:article_id/comments/:id
put at request {Token <secure_token>} to Authorization header
delete current comment by <id> by those user
````